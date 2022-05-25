# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_end_user, only: [:create]
  
  

  protected


  def reject_end_user
    #入力されたemailからアカウントを1件取得
    @end_user = EndUser.find_by(email: params[:end_user][:email].downcase)
    if @enda_user
      # 入力されたパスワードが正しいか確認
      if (@end_user.valid_password?(params[:end_user][:password]) && (@end_user.active_for_authentication? == false))
        flash[:alert] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_end_user_session_path
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
