class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, comment: "Tên loại"
      t.string :slug
      t.text :image, comment: "Ảnh cho phân loại"
      t.timestamps
    end
  end
end
