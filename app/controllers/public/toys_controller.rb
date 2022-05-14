class Public::ToysController < ApplicationController
  def index
    @toys = Toy.all
    @toy = Toy.new

  end

  def show
    @toy = Toy.find(params[:id])
    @end_user = @toy.end_user
    @toy_new = Toy.new
    @toy_user = @toy.end_user
    @post_comment = PostComment.new #コメント機能
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy =Toy.new(toy_params)
    @toy.end_user_id = current_end_user.id #これがないと投稿ができない
    if @toy.save
      redirect_to toy_path(@toy.id), notice: "おもちゃの投稿に成功しました"
    else
      @toys = Toy.all
      render :new
    end
  end

  def edit
     @toy = Toy.find(params[:id])
  end

  def update
    @toy = Toy.find(params[:id])
    if @toy.update(toy_params)
      redirect_to toy_path(@toy), notice: "投稿内容を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect_to toys_path
  end

  private

  def toy_params
    params.require(:toy).permit(:image,:name,:caption,:genre_id)
  end
end
