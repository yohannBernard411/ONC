
# set up variables:
CART_STATES = %w(awaiting paid manufacturing dispatched closed)
SIZES = ["XS", "S", "M", "L", "XL"]
COLORS = %w[red blue yellow orange pink green]

# destroy all
puts "destroy all dyeings"
Dyeing.destroy_all
puts "destroy all scalings"
Scaling.destroy_all
puts "destroy all line items"
LineItem.destroy_all
puts "destroy all sizes"
Size.destroy_all
puts "destroy all colors"
Color.destroy_all
puts "destroy all carts"
Cart.destroy_all
puts "destroy all orders"
Order.destroy_all
puts "destroy all delivery adress"
DeliveryAdress.destroy_all
puts "destroy all comments"
Comment.destroy_all
puts "destroy all users"
User.destroy_all
puts "destroy all clothes"
Clothe.destroy_all

# clothes generating without photos (add in edit)
puts "regenerating all clothes"
Clothe.create!(name: "Sac violet", category: "sac", option: "", scoring: 3.8, nbov: 14, delivery: "Livraison gratuite à partir de 250 € d'achat", delivery_color: "green" , stock: 3, wire_type: "tissu", description: "Joli petit sac trés pratique", price_cents: 12500)
Clothe.create!(name: "Pull rouge", category: "pull", option: "", scoring: 4.5, nbov: 28, delivery: "Livraison gratuite à partir de 250 € d'achat" , delivery_color: "purple", stock: 8, wire_type: "laine", description: "pull trés chaud pour l'hiver", price_cents: 25500)
Clothe.create!(name: "Pull rayé", category: "pull", option: "", scoring: 4.7, nbov: 32, delivery: "Livraison gratuite à partir de 250 € d'achat" , delivery_color: "orange", stock: 2, wire_type: "laine", description: "Trés beau pull", price_cents: 12300)
Clothe.create!(name: "Châle bleu", category: "châle", option: "Grand choix de couleurs", scoring: 4.7, nbov: 45, delivery: "Livraison gratuite à partir de 250 € d'achat", delivery_color: "pink", stock: 8, wire_type: "laine", description: "Joli châle", price_cents: 6500)
Clothe.create!(name: "Sac rouge", category: "sac", option: "Trés pratique", scoring: 3.4, nbov: 23, delivery: "Livraison gratuite à partir de 250 € d'achat", delivery_color: "red", stock: 6, wire_type: "laine", description: "Petit sac trés pratique", price_cents: 12800)

# users generating
puts "regenerating all users"
User.create!(email: "yohannb215@gmail.com", admin: true, username: "SuperYoyo", password: "Guitare512$")
User.create!(email: "sonia.bernard00@orange.fr", admin: true, username: "SuperSony", password: "azerty")
User.create!(email: "simpleuser@gmail.com", admin: false, username: "SimpleUser", password: "azerty")

# comments generating
puts "regenerating all comments"
10.times do
  Comment.create!(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 5, to: 20)), note: Faker::Number.between(from: 0, to: 5), clothe_id: Faker::Number.between(from: Clothe.first.id, to: Clothe.last.id), user_id: Faker::Number.between(from: User.first.id, to: User.last.id))
end

# delivery_adress generating
puts "regenerating all adresses"
10.times do
  DeliveryAdress.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , adress1: Faker::Address.secondary_address, adress2: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code, delivery_instructions: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 5, to: 10)), code_secure: Faker::Number.number(digits: 4), phone_number: Faker::Number.leading_zero_number(digits: 10))
end

# order generating
puts "regenerating all orders"
10.times do
  Order.create!(state: CART_STATES.sample, amount_cents: Faker::Number.between(from: 5000, to: 25000))
end

# cart generating
puts "regenerating all carts"
10.times do
  Cart.create!(order_id: Faker::Number.between(from: Order.first.id, to: Order.last.id), user_id: Faker::Number.between(from: User.first.id, to: User.last.id), state: CART_STATES.sample, price_cents: Faker::Number.between(from: 5000, to: 25000))
end

# color generating
puts "regenerating all colors"
10.times do
  Color.create!(name: Faker::Color.color_name, code_hexa: Faker::Color.hex_color, code_rgb: (Faker::Color.rgb_color).to_s)
end

# size generating
puts "regenerating all sizes"
SIZES.each do |size|
  Size.create!(name: size)
end

# line_item generating
puts "regenerating all line items"
10.times do
  LineItem.create!(cart_id: Faker::Number.between(from: Cart.first.id, to: Cart.last.id), clothe_id: Faker::Number.between(from: Clothe.first.id, to: Clothe.last.id), quantity: Faker::Number.between(from: 1, to: 3), size: Faker::Number.between(from: Size.first.id, to: Size.last.id), color: Faker::Number.between(from: Color.first.id, to: Color.last.id), state: CART_STATES.sample)
end

# scaling generating
puts "regenerating all scalings"
10.times do
  Scaling.create!(size_id: Faker::Number.between(from: Size.first.id, to: Size.last.id), clothe_id: Faker::Number.between(from: Clothe.first.id, to: Clothe.last.id))
end

# dyeing generating
puts "regenerating all dyeing"
10.times do
  Dyeing.create!(color_id: Faker::Number.between(from: Color.first.id, to: Color.last.id), clothe_id: Faker::Number.between(from: Clothe.first.id, to: Clothe.last.id))
end
