class OrdersController < ApplicationController
  def index
    if params[:date].present?
      @orders = Order.where("Date(created_at) = ?", params[:date])
    else
      @orders = Order.where("Date(created_at) = ?", Date.today)
    end
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

  def cacl_price_dish
    dish = Dish.find_by id: params[:name_dish_id]
    price_order_dish = dish.price.present? ? (dish.price)*params[:quantity].to_i : 0

    render json: { status: true, price_order_dish: price_order_dish}
  end

  private
  def order_params
    strong_params = [
      :name, :user_id, :total_price,
      order_dishes_attributes: [:id, :dish_id, :order_id, :quantity, :price, :_destroy]
    ]

    params.require(:order).permit(strong_params)
  end
end
