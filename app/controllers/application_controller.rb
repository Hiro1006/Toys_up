class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
      if end_user_signed_in?
        end_user_path(@end_user.id)
      else
        admin_root_path
      end
   end

   private
   def configure_permitted_parameters
    #会員情報に反映されるための記述
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :email, :address, :postal_code])

  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end
end
