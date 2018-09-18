puts "===== Destroy User ====="
User.destroy_all
puts "===== End ====="
puts "===== Destroy ExportedItem ====="
ExportedItem.destroy_all
puts "===== End ====="
puts "===== Destroy ExportedItem ====="
Export.destroy_all
puts "===== End ====="
puts "===== Destroy Product ====="
Product.destroy_all
puts "===== End ====="
puts "===== Destroy Supplier ====="
Supplier.destroy_all
puts "===== End ====="


puts "===== Start adding User ====="
user = User.create(email: "thach@gmail.com", password: "Thach123", username: "Louis", firstname: "Thach", lastname: "Duong Ngoc", dob: "22/09/1997", phone: "0965406112", address: "Thanh Pho Ho Chi Minh")
puts "===== Add User successfully ====="

puts "===== Start adding Supplier ====="
supplier = Supplier.create(name: "apple")
supplier2 = Supplier.create(name: "SamSung")
supplier3 = Supplier.create(name: "HTC")
puts "===== Add Supplier successfully ====="

puts "===== Start adding Product ====="
product = Product.create!(name: "Iphone 8", price: 18000000, quantity: "100",country: "USA", supplier: supplier)
product2 = Product.create!(name: "Iphone X", price: 20000000, quantity: "100",country: "USA", supplier_id: supplier.id)
product3 = Product.create!(name: "Iphone 8+", price: 19000000, quantity: "100",country: "USA", supplier: supplier)
product4 = Product.create!(name: "Samsung J8", price: 8000000, quantity: "100",country: "korean", supplier: supplier2)
product5 = Product.create!(name: "Samsung A8", price: 18000000, quantity: "100",country: "korean", supplier: supplier2)
product6 = Product.create!(name: "Samsung A8+", price: 28000000, quantity: "100",country: "korean", supplier: supplier2)
product7 = Product.create!(name: "HTC U11", price: 8000000, quantity: "100",country: "Taiwan", supplier: supplier3)
product8 = Product.create!(name: "TC U11+", price: 18000000, quantity: "100",country: "Taiwan", supplier: supplier3)
product9 = Product.create!(name: "HTC U12+", price: 28000000, quantity: "100",country: "Taiwan", supplier: supplier3)
puts "===== Add Product successfully ====="

puts "===== Start Adding Export ====="
export = Export.create!(price: 2000000, user: user)
puts "===== Add Export successfully ====="

puts "===== Start Adding Export ====="
exporteditem = ExportedItem.create(quantity: 20, unit_price: 250000000, export: export, product: product)
exporteditem2 = ExportedItem.create(quantity: 20, unit_price: 250000000, export: export, product: product2)
puts "===== Add Export successfully ====="


# product = Product.create(name: "", user_id: user.id)