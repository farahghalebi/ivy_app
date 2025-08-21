class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.role = "user"
    @message.chat = @chat


    if @message.save
      if @chat.title == "Untitled"
        @chat.generate_title_from_first_message
      end
      build_messages_history
      @response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: @response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      render "chats/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def instructions
    <<~PROMPT
       1) PERSONA
      you are a professional fragnace consultant. you tone is tone  "friendly and concise". you explain simplyè, avoid jargon, and keep answers user-friendly.
      candidate perfume: #{@chat.perfume.name} _ #{@chat.perfume.description}"
        2) CONTEXT
        _ Breifly describe the scent profile (top/heart/base notes if known)
        _ Explain why it fits the occasion and category.
        _ Give a quick vibe/mood line ( how it feels / who it suits).
        3) FORMAT
        _ 3 short sentances max.
        _ plain language, no bullet point in the final answer.
        _ End with "Perfect for #{@chat.perfume.occasion}

    PROMPT
  end

  def build_messages_history
    @ruby_llm_chat = RubyLLM.chat
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message({ role: message.role, content: message.content })
    end
  end
end
