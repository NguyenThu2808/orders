class OrdersController < ApplicationController
  def index
    @orders = Order.all()
  end

  def show
    @order = Order.find_by id: params[:id]
  end

  def new
    @order = Order.new
    @dishes = Dish.all()
    @order.order_dishes.build
    # unless @order.order_dishes.present?
  end

  def create
    @order = Order.new order_params
    # @order_dishes = OrderDish.new

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find_by id: params[:id]
    @dishes = Dish.all()
    # @order.order_dishes
  end

  def update
    @order = Order.find_by id: params[:id]

    if @order.update_attributes order_params
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find_by id: params[:id]
    @order.destroy
    @order.order_dishes.destroy

    redirect_to orders_path
  end

  private
  def order_params
    strong_params = [
      :name, :user_id, :total_price,
      order_dishes_attributes: [:id, :dish_id, :order_id, :quantity, :_destroy]
    ]

    params.require(:order).permit(strong_params)
  end
end
