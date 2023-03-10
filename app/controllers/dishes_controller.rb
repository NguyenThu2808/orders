class DishesController < ApplicationController
  def index
    @dishes = Dish.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    # @dish = Dish.find_by(id: params[:id])
    redirect_to edit_dish_path(params[:id])
  end

  def new

  end

  def create

  end

  def edit
    @dish = Dish.find_by id: params[:id]
    @categories = Category.select(:id, :name)
  end

  def update
    @dish = Dish.find_by id: params[:id]
    @categories = Category.select(:id, :name)

    if @dish.update_attributes dish_params
      redirect_to dishes_path
    else
      render :edit
    end
  end

  def destroy
    @dish = Dish.find_by id: params[:id]
    return if @dish.nil?
    @dish.destroy
    redirect_to dishes_path
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :categoru_id, :price)
  end
end
