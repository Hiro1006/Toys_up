class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @toys = Toy.all
  end
end
