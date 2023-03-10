class HomeController < ApplicationController
  def index
    @order_dishes = OrderDish.group(:dish_id).order('sum_quantity DESC').sum(:quantity).take(5)
    # .take(5)
    # array_dish = []

    # @order_dishes.each do |order_dish|
    #   @dish = Dish.find_by(id: order_dish.first)
    #   @dish.quantity = order_dish.last
    # end

    # binding.pry

    # @dishes = Dish.where(id: array_dish).take 5
    # .select(:dish_id, "sum(:quantity) as dish_quantity").order("dish_quantity desc")

    # SELECT dish_id, sum(:quantity) as dish_quantity
    # From order_dishes
    # group by dish_id
    # order dish_quantity desc
  end
end
