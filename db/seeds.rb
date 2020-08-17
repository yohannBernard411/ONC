# required
require "open-uri"

# set up variables:
CART_STATES = %w(awaiting paid manufacturing dispatched closed)
SIZES = ["XS", "S", "M", "L", "XL"]
COLORS = %w[red blue yellow orange pink green]
I18n.locale = :fr

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



puts "destroy all comments"
Comment.destroy_all
puts "destroy all users"
User.destroy_all
puts "destroy all delivery adress"
DeliveryAdress.destroy_all
puts "destroy all carts"
Cart.destroy_all
puts "destroy all orders"
Order.destroy_all
puts "destroy all clothes"
Clothe.destroy_all

# clothes generating without photos (add in edit)
puts "regenerating all clothes"
clothe1 = Clothe.new(name: "Sac violet", 
                     category: "sac",
                     option: "",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "green",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Joli petit sac trés pratique",
                     price_cents: 12500)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1596458740/sdmyoggl6xhgt2y6snzm.jpg')
clothe1.photos.attach(io: file, filename: 'sac2.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597651639/op8hdlb9g1i4dyv9cg1x.jpg')
clothe1.photos.attach(io: file2, filename: 'sac2bis.jpg', content_type: 'image/jpg')
clothe1.save!

clothe2 = Clothe.new(name: "Pull rouge",
                     category: "pull",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat" ,
                     delivery_color: "purple",
                     stock: 3,
                     wire_type: "laine",
                     description: "Pull trés chaud pour l'hiver",
                     price_cents: 25500)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1596460140/zsf6r3irstyqdt4gtkvs.jpg')
clothe2.photos.attach(io: file, filename: 'pull2.jpg', content_type: 'image/jpg')
clothe2.save!

clothe3 = Clothe.new(name: "Pull rayé",
                     category: "pull",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat" ,
                     delivery_color: "orange",
                     stock: 3,
                     wire_type: "laine",
                     description: "Trés beau pull",
                     price_cents: 12300)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1596460253/cryapzu2kwkxa05dmtoc.jpg')
clothe3.photos.attach(io: file, filename: 'pull1.jpg', content_type: 'image/jpg')
clothe3.save!

clothe4 = Clothe.new(name: "Châle bleu",
                     category: "châle",
                     option: "Grand choix de couleurs",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "pink",
                     stock: 3,
                     wire_type: "laine",
                     description: "Joli châle",
                     price_cents: 6500)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1596460332/bha8uskysowpsi7yffiz.jpg')
clothe4.photos.attach(io: file, filename: 'châle.jpg', content_type: 'image/jpg')
clothe4.save!

clothe5 = Clothe.new(name: "Sac rouge",
                     category: "sac",
                     option: "Trés pratique",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "red",
                     stock: 3,
                     wire_type: "laine",
                     description: "Petit sac trés pratique",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1596460412/dz0c3mkvqryyipp1grqg.jpg')
clothe5.photos.attach(io: file, filename: 'sac1.jpg', content_type: 'image/jpg')
clothe5.save!

clothe6 = Clothe.new(name: "Porte-monnaie orange",
                     category: "porte-monnaie",
                     option: "",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "blue",
                     stock: 3,
                     wire_type: "laine",
                     description: "Ce porte monnaie vous suivra partout",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597652124/cs0vykahjafg1itiq8hx.jpg')
clothe6.photos.attach(io: file, filename: 'sac1.jpg', content_type: 'image/jpg')
clothe6.save!

clothe7 = Clothe.new(name: "Châle tête de mort",
                     category: "châle",
                     option: "Trés belles mailles",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "pink",
                     stock: 3,
                     wire_type: "laine",
                     description: "Joli châle",
                     price_cents: 6500)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597652394/fhuetssmndti84m0hvzx.jpg')
clothe7.photos.attach(io: file, filename: 'châleTDM.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597652507/imc6z0zh1nh8o21klang.jpg')
clothe7.photos.attach(io: file2, filename: 'châleTDMbis.jpg', content_type: 'image/jpg')
file3 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597652547/uxqrq36oo9ciznnjgxhd.jpg')
clothe7.photos.attach(io: file3, filename: 'châleTDMter.jpg', content_type: 'image/jpg')
clothe7.save!

clothe8 = Clothe.new(name: "Dos nu bleu",
                     category: "haut",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "green",
                     stock: 3,
                     wire_type: "laine",
                     description: "Joli dos nu, facile à porter",
                     price_cents: 6500)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653132/kbwvavddywv9dpfrw1t5.jpg')
clothe8.photos.attach(io: file, filename: 'châleTDM.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653161/qkfwddpfhwn5lyd9v9wf.jpg')
clothe8.photos.attach(io: file2, filename: 'châleTDMbis.jpg', content_type: 'image/jpg')
file3 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653180/ixlntzovkgb8fuzigojg.jpg')
clothe8.photos.attach(io: file3, filename: 'châleTDMter.jpg', content_type: 'image/jpg')
clothe8.save!

clothe9 = Clothe.new(name: "Gilet beige",
                     category: "gilet",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "blue",
                     stock: 3,
                     wire_type: "laine",
                     description: "Idéal pour les soirées fraîches",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653362/lewnjcdwkgfggabsr3nd.jpg')
clothe9.photos.attach(io: file, filename: 'gilet.jpg', content_type: 'image/jpg')
clothe9.save!

clothe10 = Clothe.new(name: "Haut coeur",
                     category: "haut",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "purple",
                     stock: 3,
                     wire_type: "coton",
                     description: "Des coeurs, des coeurs et des mailles filet, le tout dans un recyclage de coton, qui se crochète en 1.5, et que j'ai doublé pour le crocheter en 2. Il vous plait??? Parce que moi je l'adore",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653547/xbq9ie0jyqzycytb2us7.jpg')
clothe10.photos.attach(io: file, filename: 'hautcoeur.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653587/wje6xtbbtty5a9zi8f5s.jpg')
clothe10.photos.attach(io: file2, filename: 'hautcoeurbis.jpg', content_type: 'image/jpg')
clothe10.save!

clothe11 = Clothe.new(name: "Lingettes rondes",
                     category: "lingette",
                     option: "",
                     function: "zero",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "red",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Lingettes réutilisables",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653965/ttf9jut1iaosxhfgufr6.jpg')
clothe11.photos.attach(io: file, filename: 'lingronde.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597653984/xxey3g9klfxz9haibga8.jpg')
clothe11.photos.attach(io: file2, filename: 'lingrondebis.jpg', content_type: 'image/jpg')
clothe11.save!

clothe12 = Clothe.new(name: "Lingettes rectangulaires",
                     category: "lingette",
                     option: "",
                     function: "zero",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "blue",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Lingettes réutilisables",
                     price_cents: 8800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654159/emodx5mtqdr4mspgdw8h.jpg')
clothe12.photos.attach(io: file, filename: 'lingrect.jpg', content_type: 'image/jpg')
clothe12.save!

clothe13 = Clothe.new(name: "Paniére",
                     category: "sac",
                     option: "",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "green",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Panière pour emporter tout ce que vous voudrez",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654306/hn7suc87q0j2dl60sgom.jpg')
clothe13.photos.attach(io: file, filename: 'paniere.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654324/h3exzdbjswu7mtvo6hqh.jpg')
clothe13.photos.attach(io: file2, filename: 'panierebis.jpg', content_type: 'image/jpg')
clothe13.save!

clothe14 = Clothe.new(name: "Poche à pain",
                     category: "sac",
                     option: "",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "pink",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Poche à pain",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654457/jqvne9ld2euxzdvbzdck.jpg')
clothe14.photos.attach(io: file, filename: 'poche.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654479/oqklrsdo76z9ef9eynak.jpg')
clothe14.photos.attach(io: file2, filename: 'pochebis.jpg', content_type: 'image/jpg')
clothe14.save!

clothe15 = Clothe.new(name: "Snood",
                     category: "snood",
                     option: "Pour ne pas prendre froid",
                     function: "accessory",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "red",
                     stock: 3,
                     wire_type: "laine",
                     description: "Snood trés chaud",
                     price_cents: 12800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597654646/txiuatnjtasyvksnpp7v.jpg')
clothe15.photos.attach(io: file, filename: 'snood.jpg', content_type: 'image/jpg')
clothe15.save!

clothe16 = Clothe.new(name: "Veste spitzberg",
                     category: "veste",
                     option: "",
                     function: "clothing",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "green",
                     stock: 3,
                     wire_type: "laine",
                     description: "Veste Spitzberg bien colorée",
                     price_cents: 25800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597664929/rvsqnhh4ekcgctf7g27m.jpg')
clothe16.photos.attach(io: file, filename: 'spitz.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665000/kbqleraq7t8isgr3sjqa.jpg')
clothe16.photos.attach(io: file2, filename: 'spitzbis.jpg', content_type: 'image/jpg')
file3 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665017/bjgusbgqsvmzdagoazdw.jpg')
clothe16.photos.attach(io: file3, filename: 'spitzter.jpg', content_type: 'image/jpg')
file4 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665050/ngbs8cnemxgfh7ggtudg.jpg')
clothe16.photos.attach(io: file4, filename: 'spitzquat.jpg', content_type: 'image/jpg')
clothe16.save!

clothe17 = Clothe.new(name: "Charlotte à plat",
                     category: "charlotte",
                     option: "",
                     function: "zero",
                     scoring: 5,
                     nbov: 10,
                     delivery: "Livraison gratuite à partir de 250 € d'achat",
                     delivery_color: "green",
                     stock: 3,
                     wire_type: "tissu",
                     description: "Fini le film alimentaire, Vive les charlottes à plat. 100%coton et face intérieure en PUL alimentaire",
                     price_cents: 5800)
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665431/j6hnju5to9ujfgh3fuju.jpg')
clothe17.photos.attach(io: file, filename: 'char.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665447/onygwd4infdgxxjqyygm.jpg')
clothe17.photos.attach(io: file2, filename: 'charbis.jpg', content_type: 'image/jpg')
file3 = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665463/anpkszp8ejpjbjeoidjx.jpg')
clothe17.photos.attach(io: file3, filename: 'charter.jpg', content_type: 'image/jpg')
clothe17.save!

# users generating
puts "regenerating all users"

user1 = User.create!(email: "bernard.yohann516@orange.fr",
             admin: false,
             cgv: true,
             newsletter: true,
             username: "SimpleUser",
             password: "azerty",
             password_confirmation: "azerty")
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597665794/dgbihbbch3dzl4s4oqya.jpg')
user1.photo.attach(io: file, filename: 'simpleUser.jpg', content_type: 'image/jpg')
user1.skip_confirmation!

user2 = User.create!(email: "yohannb215@gmail.com",
             admin: true,
             cgv: true,
             newsletter: true,
             username: "BadassMan",
             password: "Guitare512$",
             password_confirmation: "Guitare512$")
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597666480/osr8kgjb5qy6temxk3tk.jpg')
user2.photo.attach(io: file, filename: 'BadassMan.jpg', content_type: 'image/jpg')
user2.skip_confirmation!

user3 = User.create!(email: "ocenat.creations@orange.fr",
             admin: true,
             cgv: true,
             newsletter: true,
             username: "SuperAdmin",
             password: "Valerian911$",
             password_confirmation: "Valerian911$")
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597666755/egsjvcohnwwxvykpsxsr.jpg')
user3.photo.attach(io: file, filename: 'SuperAdmin.jpg', content_type: 'image/jpg')
user3.skip_confirmation!

user4 = User.create!(email: "sonia.bernard00@orange.fr",
             admin: true,
             cgv: true,
             newsletter: true,
             username: "Sonia",
             password: "Valerian911$",
             password_confirmation: "Valerian911$")
file = URI.open('https://res.cloudinary.com/do3nu0tns/image/upload/v1597667136/guifs0gkirdmovhcxkz9.jpg')
user4.photo.attach(io: file, filename: 'Sonia.jpg', content_type: 'image/jpg')
user4.skip_confirmation!

# comments generating
puts "regenerating all comments"
50.times do
  Comment.create!(title: Faker::Book.title, 
                  content: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 5, to: 20)),
                  note: Faker::Number.between(from: 0, to: 5),
                  clothe_id: Faker::Number.between(from: Clothe.first.id, to: Clothe.last.id),
                  user_id: Faker::Number.between(from: User.first.id, to: User.last.id))
end

# delivery_adress generating
puts "regenerating all adresses"
10.times do
  DeliveryAdress.create!(first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         adress1: Faker::Address.secondary_address,
                         adress2: Faker::Address.street_address,
                         city: Faker::Address.city,
                         state: Faker::Address.state,
                         zipcode: Faker::Address.zip_code,
                         delivery_instructions: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 5, to: 10)),
                         code_secure: Faker::Number.number(digits: 4),
                         phone_number: Faker::Number.leading_zero_number(digits: 10))
end

# Special user delivery adress

delivery_adress = DeliveryAdress.create!(first_name: "Simple",
                                        last_name: "User",
                                        adress1: "Appartement 6",
                                        adress2: "52 rue Parlabas",
                                        city: "Saintes",
                                        state: "FRANCE",
                                        zipcode: "17100",
                                        delivery_instructions: "",
                                        code_secure: "8267",
                                        phone_number: "0681057323")
user1.delivery_adress_id = delivery_adress.id
user1.save!

delivery_adress1 = DeliveryAdress.create!(first_name: "Bernard",
                                        last_name: "Yohann",
                                        adress1: "Appartement 5",
                                        adress2: "41 rue Toufaire",
                                        city: "Rochefort",
                                        state: "FRANCE",
                                        zipcode: "17300",
                                        delivery_instructions: "La sonnette ne fonctionne pas, appeler en arrivant",
                                        code_secure: "",
                                        phone_number: "0621891221")

user2.delivery_adress_id = delivery_adress1.id
user2.save!

delivery_adress2 = DeliveryAdress.create!(first_name: "OceNatCreations",
                                        last_name: "Entreprise",
                                        adress1: "16 rue des tilleuls",
                                        adress2: "",
                                        city: "Baignes Ste Radegonde",
                                        state: "FRANCE",
                                        zipcode: "16360",
                                        delivery_instructions: "",
                                        code_secure: "",
                                        phone_number: "0641311956")
user3.delivery_adress_id = delivery_adress2.id
user3.save!

delivery_adress3 = DeliveryAdress.create!(first_name: "Bernard",
                                        last_name: "Sonia",
                                        adress1: "16 rue des tilleuls",
                                        adress2: "",
                                        city: "Baignes Ste Radegonde",
                                        state: "FRANCE",
                                        zipcode: "16360",
                                        delivery_instructions: "",
                                        code_secure: "",
                                        phone_number: "0641311956")
user4.delivery_adress_id = delivery_adress3.id
user4.save!

# order generating
puts "regenerating all orders"
10.times do
  Order.create!(state: CART_STATES.sample, amount_cents: Faker::Number.between(from: 5000, to: 25000))
end

# cart generating
  puts "regenerating all carts"
  Cart.create!(user_id: User.first.id, order_id: Order.first.id, state: CART_STATES.sample, price_cents: Faker::Number.between(from: 5000, to: 25000))
  Cart.create!(user_id: User.all[1].id, order_id: Order.all[1].id, state: CART_STATES.sample, price_cents: Faker::Number.between(from: 5000, to: 25000))
  Cart.create!(user_id: User.all[2].id, order_id: Order.all[2].id, state: CART_STATES.sample, price_cents: Faker::Number.between(from: 5000, to: 25000))
  Cart.create!(user_id: User.last.id, order_id: Order.last.id, state: CART_STATES.sample, price_cents: Faker::Number.between(from: 5000, to: 25000))


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
