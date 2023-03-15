class HomeController < ApplicationController
  def index
    @order_dishes = OrderDish.group(:dish_id).order('sum_quantity DESC').sum(:quantity).take(5)
  end
end
