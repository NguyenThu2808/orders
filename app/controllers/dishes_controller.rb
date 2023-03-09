class DishesController < ApplicationController
  def index
    @dishes = Dish.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  def show

  end

  def new

  end

  def create

  end

  def edit
    @dish = Dish.find_by id: params[:id]
    @categories = Category.all()
  end

  def update
    @dish = Dish.find_by id: params[:id]

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
