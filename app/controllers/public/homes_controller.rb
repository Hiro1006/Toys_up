class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @toys = Toy.all
  end

  def about
  end
end
