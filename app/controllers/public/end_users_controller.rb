class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!, only: [:show]
  def show
    @end_user = EndUser.find(params[:id])
    @currentEnduserEntry=Entry.where(end_user_id: current_end_user.id)
    @enduserEntry=Entry.where(end_user_id: @end_user.id)
    unless @end_user.id == current_end_user.id
      @currentEnduserEntry.each do |cu|
        @enduserEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path
      flash[:success] = "会員情報を更新しました"
    else
      @end_user = EndUser.find(params[:id])
      render 'edit'
    end
  end

  def index
    @end_users = EndUser.all
    @end_user = current_end_user
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    favorites= Favorite.where(end_user_id: @end_user.id).pluck(:toy_id)
    @favorite_toys = Toy.find(favorites)
  end

  def unsubscribe
     @end_user = EndUser.find_by(email: params[:email])
  end

  def withdraw
    @end_user = current_end_user
    @end_user.is_deleted = true
    @end_user.save!
    reset_session
    flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def search #検索機能(gemなし)
    @end_users = EndUser.search(params[:search])
    # binding.irb
#@toyは好きなものを入力して、Toyの部分には検索したいテーブル名を入力する
  end

   private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :nickname, :email, :postal_code, :address)
  end

end
