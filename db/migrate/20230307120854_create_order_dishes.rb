class CreateOrderDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_dishes do |t|
      t.integer :order_id, comment: "Ma don hang"
      t.integer :dish_id, comment: "Mon an"
      t.integer :quantity, comment: "So luong mon an"
      t.timestamps
    end
  end
end
