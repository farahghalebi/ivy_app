# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Clean the database 🗑️
puts "Cleaning database..."
Perfume.destroy_all

# 2. Create the instances 🏗️
puts "Seeding perfumes..."

Perfume.create!(
  name: "Chanel No. 5",
  category: "Eau de Parfum",
  description: "A timeless, iconic fragrance with floral aldehydic notes and a sophisticated trail.",
  url: "https://www.chanel.com/us/fragrance/p/110535/n5-eau-de-parfum-spray/"
)

Perfume.create!(
  name: "Dior Sauvage",
  category: "Eau de Toilette",
  description: "A fresh, bold scent with notes of bergamot, pepper, and ambroxan.",
  url: "https://www.dior.com/en_int/beauty/products/Y0996446-sauvage-eau-de-toilette"
)

Perfume.create!(
  name: "Yves Saint Laurent Black Opium",
  category: "Eau de Parfum",
  description: "A sensual, addictive fragrance with coffee, vanilla, and white flowers.",
  url: "https://www.yslbeautyus.com/fragrance/black-opium/black-opium-eau-de-parfum/3614270561678.html"
)

puts "Seeding completed! #{Perfume.count} perfumes in DB ✅"
