class Public::RoomsController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, end_user_id: current_end_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:end_user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(end_user_id: current_end_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
