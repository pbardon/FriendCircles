class FeedsController < ApplicationController
  def show
    @feed = current_user.shared_posts
    
  end
end