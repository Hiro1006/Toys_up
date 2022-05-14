class Public::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
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

   private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :nickname, :email, :postal_code, :address)
  end

end
