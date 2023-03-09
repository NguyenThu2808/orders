class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, comment: "Ten khach hang"
      t.integer :user_id, comment: "Nguoi tao don"
      t.float :total_price, comment: "Tong tien"
      t.timestamps
    end
  end
end
