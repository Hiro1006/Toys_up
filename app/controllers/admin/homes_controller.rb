class Admin::HomesController < ApplicationController
  def top
    @toys = Toy.all
  end
end
