class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location root_url)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
