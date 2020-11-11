puts "===== Destroy ExportedItem ====="
ExportedItem.destroy_all
puts "===== End ====="

puts "===== Destroy Export ====="
Export.destroy_all
puts "===== End ====="

puts"===== Destroy ImportedItem ====="
ImportedItem.destroy_all
puts "===== End ====="

puts "===== Destroy Import ====="
Import.destroy_all
puts "===== End ====="

puts "===== Destroy Product ====="
Product.destroy_all
puts "===== End ====="

puts "===== Destroy Supplier ====="
Supplier.destroy_all
puts "===== End ====="

puts "===== Destroy Brand ====="
Brand.destroy_all
puts "===== End ====="

puts "===== Destroy Customer ====="
Customer.destroy_all
puts "===== End ====="

puts "===== Destroy User ====="
User.destroy_all
puts "===== End ====="


puts "===== Start adding User ====="
user = User.create(email: "thach@gmail.com", password: "Thach123", username: "Louis", firstname: "Thach", lastname: "Duong Ngoc", dob: "22/09/1997", phone: "0965406112", address: "Thanh Pho Ho Chi Minh", type: Admin)
user2 = User.create(email: "phat@gmail.com", password: "Thach123", username: "James", firstname: "Phat", lastname: "La Hong", dob: "06/04/1990", phone: "0933557739", address: "Thanh Pho Ho Chi Minh", type: Staff)
puts "===== Add User successfully ====="