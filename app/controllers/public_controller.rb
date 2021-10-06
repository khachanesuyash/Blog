class PublicController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def tags
    render plain: params[:tag]
  end
end
