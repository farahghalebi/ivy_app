class ChatsController < ApplicationController
  def show
      @perfume = Perfume.find(params[:perfume_id])
      @chat = Chat.new  # current_user.chats.where(perfume: @perfume)
  end

  def new
    @chat = Chat.new
  end
end
