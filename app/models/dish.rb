class Dish < ApplicationRecord
  has_many :order_dishes, dependent: :destroy
  has_many :orders, through: :order_dishes

  belongs_to :category, optional: true
end
