namespace :db do
  task create_category_sample: :environment do
    array_category = ["Đồ ăn", "Đồ uống", "Hoa quả"]

    array_category.each do |name_category| 
      Category.create(name: name_category)
    end
  end
end
