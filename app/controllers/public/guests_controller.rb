class Public::GuestsController < ApplicationController
  def new_guest
   end_user = EndUser.find_or_create_by!(email: 'guest@example.com') do |end_user|
     end_user.nickname = "ゲスト"
     end_user.password = 'password'
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
   sign_in end_user
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end