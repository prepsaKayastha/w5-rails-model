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
  {
    name: "Home Goods",
    description: "Practical essentials for everyday living."
  },
  {
    name: "Kitchen",
    description: "Tools and accessories for cooking and serving."
  },
  {
    name: "Accessories",
    description: "Small items that add convenience and style."
  },
  {
    name: "Self Care",
    description: "Wellness and personal care items."
  }
]

category_records = categories.each_with_object({}) do |attrs, memo|
  category = Category.find_or_initialize_by(name: attrs[:name])
  category.description = attrs[:description]
  category.save!
  memo[attrs[:name]] = category
end

products = [
  {
    name: "Canvas Tote",
    description: "Durable everyday tote with reinforced stitching.",
    price: 240,
    quantity: 10,
    category_name: "Accessories"
  },
  {
    name: "Ceramic Mug",
    description: "12oz mug with matte glaze finish.",
    price: 160,
    quantity: 4,
    category_name: "Kitchen"
  },
  {
    name: "Desk Lamp",
    description: "Adjustable arm lamp with warm LED bulb.",
    price: 540,
    quantity: 0,
    category_name: "Home Goods"
  },
  {
    name: "Tissue holder",
    description: "Pop up tissue holder with sleek design.",
    price: 100,
    quantity: 11,
    category_name: "Home Goods"
  },
  {
    name: "Water bottle",
    description: "1l stainless steel insulated bottle.",
    price: 670,
    quantity: 6,
    category_name: "Accessories"
  },
  {
    name: "Soap dispenser",
    description: "Refillable pump dispenser with modern look.",
    price: 320,
    quantity: 6,
    category_name: "Home Goods"
  },
  {
    name: "Electric Kettle",
    description: "1.7L rapid boil kettle with auto shut-off.",
    price: 2240,
    quantity: 5,
    category_name: "Kitchen"
  },
  {
    name: "Jwellery box",
    description: "Multi-compartment box with velvet lining.",
    price: 860,
    quantity: 4,
    category_name: "Accessories"
  },
  {
    name: "Crochet flower keychain",
    description: "Handmade crochet flower keychain in assorted colors.",
    price: 150,
    quantity: 20,
    category_name: "Accessories"
  },
  {
    name: "Beard oil",
    description: "Natural beard oil with essential oils.",
    price: 300,
    quantity: 12,
    category_name: "Self Care"
  },
  {
    name: "Scented candle",
    description: "Soy wax candle with lavender scent.",
    price: 700,
    quantity: 14,
    category_name: "Home Goods"
  },
  {
    name: "Sleep mask",
    description: "Silk sleep mask with adjustable strap.",
    price: 500,
    quantity: 3,
    category_name: "Self Care"
  }
]

products.each do |attrs|
  product = Product.find_or_initialize_by(name: attrs[:name])
  product.description = attrs[:description]
  product.price = attrs[:price]
  product.quantity = attrs[:quantity]
  product.category = category_records.fetch(attrs[:category_name])
  product.save!
end

customers = [
  {
    first_name: "Avery",
    last_name: "Singh",
    email: "avery.singh@example.com"
  },
  {
    first_name: "Jordan",
    last_name: "Lopez",
    email: "jordan.lopez@example.com"
  },
  {
    first_name: "Riley",
    last_name: "Chen",
    email: "riley.chen@example.com"
  }
]

customer_records = customers.each_with_object({}) do |attrs, memo|
  customer = Customer.find_or_initialize_by(email: attrs[:email])
  customer.first_name = attrs[:first_name]
  customer.last_name = attrs[:last_name]
  customer.save!
  memo[attrs[:email]] = customer
end

orders = [
  {
    customer_email: "avery.singh@example.com",
    ordered_at: Time.zone.parse("2025-01-15 09:10"),
    item_names: ["Canvas Tote", "Ceramic Mug"]
  },
  {
    customer_email: "jordan.lopez@example.com",
    ordered_at: Time.zone.parse("2025-01-18 14:45"),
    item_names: ["Electric Kettle", "Scented candle", "Sleep mask"]
  },
  {
    customer_email: "riley.chen@example.com",
    ordered_at: Time.zone.parse("2025-01-21 19:30"),
    item_names: ["Beard oil", "Crochet flower keychain"]
  }
]

order_records = orders.each_with_object({}) do |attrs, memo|
  customer = customer_records.fetch(attrs[:customer_email])
  products_for_order = attrs[:item_names].map { |name| Product.find_by!(name: name) }
  order = Order.find_or_initialize_by(customer: customer, ordered_at: attrs[:ordered_at])
  order.total = products_for_order.sum(&:price)
  order.save!

  products_for_order.each do |product|
    OrderItem.find_or_create_by!(order: order, product: product)
  end

  memo[[attrs[:customer_email], attrs[:ordered_at]]] = order
end

shipping_details = [
  {
    customer_email: "avery.singh@example.com",
    ordered_at: Time.zone.parse("2025-01-15 09:10"),
    address_line1: "1124 Riverwalk Ave",
    city: "Austin",
    state: "TX",
    shipped_at: Time.zone.parse("2025-01-16 13:00")
  },
  {
    customer_email: "jordan.lopez@example.com",
    ordered_at: Time.zone.parse("2025-01-18 14:45"),
    address_line1: "89 Market Street",
    city: "San Diego",
    state: "CA",
    shipped_at: Time.zone.parse("2025-01-19 10:20")
  },
  {
    customer_email: "riley.chen@example.com",
    ordered_at: Time.zone.parse("2025-01-21 19:30"),
    address_line1: "455 Maple Lane",
    city: "Seattle",
    state: "WA",
    shipped_at: Time.zone.parse("2025-01-22 15:35")
  }
]

shipping_details.each do |attrs|
  order = order_records.fetch([attrs[:customer_email], attrs[:ordered_at]])
  shipping_detail = ShippingDetail.find_or_initialize_by(order: order)
  shipping_detail.address_line1 = attrs[:address_line1]
  shipping_detail.city = attrs[:city]
  shipping_detail.state = attrs[:state]
  shipping_detail.shipped_at = attrs[:shipped_at]
  shipping_detail.save!
end
