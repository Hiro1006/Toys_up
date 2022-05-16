class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @toys = Toy.where(genre_id: @genre.id)
    @genres = Genre.all
  end
end
