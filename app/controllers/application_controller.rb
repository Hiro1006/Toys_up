class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   private
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :email, :address, :postal_code])#会員情報に反映されるための記述

  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end
end
