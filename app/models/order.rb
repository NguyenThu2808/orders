class Order < ApplicationRecord
  has_many :order_dishes, dependent: :destroy
  has_many :dishes, through: :order_dishes

  accepts_nested_attributes_for :order_dishes, reject_if: :all_blank, allow_destroy: true

  after_save :cacl_total_price

  def cacl_total_price
    total_price = self.order_dishes.sum("price")
    self.update_column(:total_price, total_price)
  end
end
