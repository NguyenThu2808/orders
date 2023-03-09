class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, comment: "Ten mon an"
      t.float :price, comment: "Gia mon an"
      t.string :note, comment: "Ghi chu"
      t.text :image, comment: "Hinh anh mon an"
      t.integer :category_id, comment: "Loại món ăn"
      t.string :slug
      t.timestamps
    end
  end
end
