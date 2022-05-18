class Admin::ToysController < ApplicationController
  before_action :authenticate_admin!
  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find(params[:id])
  end
  
  def edit
     @toy = Toy.find(params[:id])
  end

  def update
    @toy = Toy.find(params[:id])
    if @toy.update(toy_params)
      redirect_to admin_toy_path(@toy), notice: "投稿内容を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect_to admin_toys_path
  end

  
  private

  def toy_params
    params.require(:toy).permit(:image,:name,:caption,:genre_id)
  end
end
