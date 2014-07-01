class CirclesController < ApplicationController
  def new
    @circle  = Circle.new
  end
  
  def create
    @circle = current_user.circles.build(circle_params)
    if @circle.save
      redirect_to user_circles_url(current_user)
    else
      flash[:errors] = @circle.errors.full_messages
      render :new
    end
  end
  
  def edit
    @circle = Circle.find(params[:id])
  end
  
  def index
    @user = User.find(params[:user_id])
  end
  
  def show
    @user = User.find(params[:user_id])
    @circle = Circle.find(params[:id])
  end
  

  def update
    @circle = Circle.find(params[:id])
    if @circle.update_attributes(circle_params)
      redirect_to user_circles_url(current_user)
    else
      flash[:errors] = @circle.errors.full_messages
      render :edit
    end
    
  end
  
  private
  
  def circle_params
    params.require(:circle).permit(:name, member_ids: [])
  end
end