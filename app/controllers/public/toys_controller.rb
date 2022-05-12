class Public::ToysController < ApplicationController
  def index
    @toys = Toy.all

  end

  def show
    @toy = Toy.find(params[:id])
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy =Toy.new(toy_params)
    @toy.end_user_id = current_end_user.id
    if @toy.save
      redirect_to toy_path(@toy.id)
    else
      @toys = Toy.all
      render :new
    end
  end

  def edit
  end

  private

  def toy_params
    params.require(:toy).permit(:image,:name,:caption,:genre_id)
  end
end
