class Public::MessagesController < ApplicationController
  before_action :authenticate_end_user!, only: [:create]

  def create
    if Entry.where(end_user_id: current_end_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params.merge(end_user_id: current_end_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end

  private

  def message_params
    params.require(:message).permit(:end_user_id, :message, :room_id)
  end
end
