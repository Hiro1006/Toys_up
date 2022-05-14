class Admin::ToysController < ApplicationController
  def index
    @toys = Toy.all
  end

  def show
  end

  def edit
  end
end
