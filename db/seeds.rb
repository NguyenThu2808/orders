array_name = ["Ốc bé", "Ốc to", "Ốc lẫn", "Cút lộn xào me (Loại 10 quả)",
  "Cút lộn xào me (Loại 20 quả)", "Cút lộn xào me (Loại 30 quả)",
  "Trứng cút lộn luộc", "Trứng cút lộn luộc (Loại 20 quả)",
  "Trứng cút lộn luộc (Loại 30 quả)", "Ngao hấp", "Ngao trộn xoài",
  "Nem chua rán", "Khoai lang kén", "Khoai môn lệ phố", "Khoai lang chiên",
  "Khoai lang nghiền", "Xúc xích", "Cá chỉ vàng nướng/cá nướng ", "Hướng dướng (nhiều vị)"]

array_name.each do |name|
  Dish.find_or_create_by(name: name, category_id: 1)
end
