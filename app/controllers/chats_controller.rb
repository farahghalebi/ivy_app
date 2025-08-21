class ChatsController < ApplicationController
  def index
    @perfume = Perfume.find(params[:perfume_id])
    @chats = current_user.chats.where(perfume: @perfume)
    @chat = Chat.new
  end

  def create
    @perfume = Perfume.find(params[:perfume_id])
    @chat = Chat.new(title: "Untitled", model_id: "gpt-4.1-nano")
    @chat.perfume = @perfume
    @chat.user = current_user
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render :index
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def new
    @perfume = Perfume.find(params[:perfume_id])
    @chat = Chat.new
  end
end
