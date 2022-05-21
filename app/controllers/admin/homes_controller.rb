class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @toys = Toy.page(params[:page]).per(10)
  end
end
