# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

products = [
  {
    name: "Canvas Tote",
    description: "Durable everyday tote with reinforced stitching.",
    price: 240,
    quantity: 10
  },
  {
    name: "Ceramic Mug",
    description: "12oz mug with matte glaze finish.",
    price: 160,
    quantity: 4
  },
  {
    name: "Desk Lamp",
    description: "Adjustable arm lamp with warm LED bulb.",
    price: 540,
    quantity: 0
  },
  {
    name: "Tissue holder",
    description: "Pop up tissue holder with sleek design.",
    price: 100,
    quantity: 11
  },
  {
    name: "Water bottle",
    description: "1l stainless steel insulated bottle.",
    price: 670,
    quantity: 6
  },
  {
    name: "Soap dispenser",
    description: "Refillable pump dispenser with modern look.",
    price: 320,
    quantity: 6
  },
  {
    name: "Electric Kettle",
    description: "1.7L rapid boil kettle with auto shut-off.",
    price: 2240,
    quantity: 5
  },
  {
    name: "Jwellery box",
    description: "Multi-compartment box with velvet lining.",
    price: 860,
    quantity: 4
  },
  {
    name: "Crochet flower keychain",
    description: "Handmade crochet flower keychain in assorted colors.",
    price: 150,
    quantity: 20
  },
  {
    name: "Beard oil",
    description: "Natural beard oil with essential oils.",
    price: 300,
    quantity: 12
  },
  {
    name: "Scented candle",
    description: "Soy wax candle with lavender scent.",
    price: 700,
    quantity: 14
  },
  {
    name: "Sleep mask",
    description: "Silk sleep mask with adjustable strap.",
    price: 500,
    quantity: 3
  }
]

products.each do |attrs|
  Product.find_or_create_by!(name: attrs[:name]) do |product|
    product.description = attrs[:description]
    product.price = attrs[:price]
    product.quantity = attrs[:quantity]
  end
end
