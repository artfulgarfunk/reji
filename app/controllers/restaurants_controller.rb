class RestaurantsController < ApplicationController
  def restaurant_params
    params.require(:restaurant).permit(:name)
    # params.require(:restaurant).permit(:description)
    # params.require(:restaurant).permit(:id)
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
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
