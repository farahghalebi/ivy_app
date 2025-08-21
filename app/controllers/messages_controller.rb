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
    "#{@chat.perfume.name} - #{@chat.perfume.description}" #Promt Engineering part here 1. PERSONA 2. CONTEXT 3.CONTENT 4.FORMAT
  end

  def build_messages_history
    @ruby_llm_chat = RubyLLM.chat
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message({role: message.role, content: message.content})
    end
  end
end
