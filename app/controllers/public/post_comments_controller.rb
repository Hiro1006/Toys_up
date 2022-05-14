class Public::PostCommentsController < ApplicationController
  def create
    toy = Toy.find(params[:toy_id])
    comment = current_end_user.post_comments.new(post_comment_params)
    comment.toy_id = toy.id
    comment.save
    redirect_to toy_path(toy)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to toy_path(params[:toy_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
