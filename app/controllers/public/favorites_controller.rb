class Public::FavoritesController < ApplicationController
  def create
    toy = Toy.find(params[:toy_id])
    favorite = current_end_user.favorites.new(toy_id: toy.id)
    favorite.save
    redirect_to toy_path(toy)
  end

  def destroy
    toy = Toy.find(params[:toy_id])
    favorite = current_end_user.favorites.find_by(toy_id: toy.id)
    favorite.destroy
    redirect_to toy_path(toy)
  end
end
