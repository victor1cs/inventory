# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [
  "Celular",
  "Tablet",
  "Notebook",
  "Smartwatch",
  "Smart TV",
  "AirPods",
  "Acessórios"
]

categories.each do |category|
  Category.find_or_create_by(name: category)
end

puts "Categorias criadas com sucesso!"

user = User.find_or_create_by(email: "pdx@smartfit.com") do |u|
  u.password = "123456"
  u.password_confirmation = "123456"
end

puts "Usuário criado com sucesso!"


celular = Category.find_by(name: "Celular")
tablet = Category.find_by(name: "Tablet")
notebook = Category.find_by(name: "Notebook")
smartwatch = Category.find_by(name: "Smartwatch")
airpods = Category.find_by(name: "AirPods")

products_data = [
  {
    name: "iPhone 15 Pro",
    description: "iPhone 15 Pro 256GB Space Black",
    price: 8999.00,
    color: "Space Black",
    storage: "256GB",
    battery_percentage: 100,
    condition: :factory_new,
    status: :in_stock,
    category: celular
  },
  {
    name: "iPhone 14",
    description: "iPhone 14 128GB Azul",
    price: 5999.00,
    color: "Azul",
    storage: "128GB",
    battery_percentage: 87,
    condition: :used,
    status: :in_stock,
    category: celular
  },
  {
    name: "iPad Pro 12.9",
    description: "iPad Pro 12.9 polegadas 256GB",
    price: 7999.00,
    color: "Cinza Espacial",
    storage: "256GB",
    battery_percentage: 95,
    condition: :factory_new,
    status: :in_stock,
    category: tablet
  },
  {
    name: "MacBook Pro 14",
    description: "MacBook Pro 14 polegadas M3",
    price: 14999.00,
    color: "Space Gray",
    storage: "512GB",
    battery_percentage: nil,
    condition: :factory_new,
    status: :in_stock,
    category: notebook
  },
  {
    name: "Apple Watch Series 9",
    description: "Apple Watch Series 9 GPS 45mm",
    price: 3999.00,
    color: "Midnight",
    storage: "N/A",
    battery_percentage: 92,
    condition: :used,
    status: :in_stock,
    category: smartwatch
  },
  {
    name: "AirPods Pro 2",
    description: "AirPods Pro 2ª geração",
    price: 2499.00,
    color: "Branco",
    storage: "N/A",
    battery_percentage: 88,
    condition: :used,
    status: :in_stock,
    category: airpods
  }
]

products_data.each do |product_data|
  Product.create!(product_data)
end

puts "Produtos criados com sucesso!"
