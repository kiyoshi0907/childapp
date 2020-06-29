class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build  # form_with 用
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    end
  end
  
  def yonen
     @yonen = current_user.feed_posts.where(category: 'yonen').order(id: :desc).page(params[:page])
  end
  
  def zido
     @zido = current_user.feed_posts.where(category: 'zido').order(id: :desc).page(params[:page])
  end
  
  def question
     @question = current_user.feed_posts.where(category: 'question').order(id: :desc).page(params[:page])
  end
end
