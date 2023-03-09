class Order < ApplicationRecord
  has_many :order_dishes, dependent: :destroy
  has_many :dishes, through: :order_dishes

  accepts_nested_attributes_for :order_dishes, reject_if: :all_blank, allow_destroy: true
end
