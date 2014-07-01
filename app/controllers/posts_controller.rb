class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(body: post_params[:body], user_id: params[:user_id])
    @post.links.new(link_params) 
    if @post.save
      post_params[:circles].each do |circle_id|
        PostShare.new(circle_id: circle_id, post_id: @post.id).save!
      end
      redirect_to user_posts_url(current_user)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end
  

  def show
    @post = Post.find(params[:id])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :user_id, circles: [])
  end
  
  def link_params
    params.permit(link: [:title, :url])
          .require(:link)
          .values
          .reject{ |data| data.values.all?(&:blank?) }
  end
end
