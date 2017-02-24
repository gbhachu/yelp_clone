class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  def index
    if user_signed_in?
    end
    @restaurants = Restaurant.all
    @current_user = current_user
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
   @restaurant = Restaurant.find(params[:id])
  end

 def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
 end

 def destroy
   @restaurant = Restaurant.find(params[:id])
   @restaurant.destroy
   flash[:notice] = 'Restaurant deleted successfully'
   redirect_to '/restaurants'
 end
end
