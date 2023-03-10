class Dish < ApplicationRecord
  attr_accessor :quantity
  has_many :order_dishes, dependent: :destroy
  has_many :orders, through: :order_dishes

  belongs_to :category, optional: true

  validates :price, presence: true
end
