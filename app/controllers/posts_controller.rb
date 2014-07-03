class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.links.new(link_params)


    if @post.save
      # share_post(@post, post_params[:circle_ids])
      redirect_to user_posts_url(current_user)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def show
    @post = Post.find(params[:id])
  end

  def upvote
    @upvote = Upvote.new(user_id: current_user.id, post_id: params[:post_id])
    if already_voted?(Post.find(params[:post_id]))
      flash[:errors] = ["Already Voted"]
    else
      @upvote.save!
    end
    redirect_to feed_url
  end

  def downvote
    @downvote = Downvote.new(user_id: current_user.id, post_id: params[:post_id])
    if already_voted?(Post.find(params[:post_id]))
      flash[:errors] = ["Already Voted"]
    else
      @downvote.save!
    end
    redirect_to feed_url
  end

  # def clear_vote
  #   downvote = @user.downvotes.find_by_post_id(params[:post_id])
  # end

  private


  def share_post(post, circles)
    circles.each do |circle|
      PostShare.new(circle_id: circle.to_i, post_id: post.id).save!
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, circle_ids: [])
  end

  def link_params
    params.permit(link: [:title, :url])
          .require(:link)
          .values
          .reject{ |data| data.values.all?(&:blank?)}
  end
end
