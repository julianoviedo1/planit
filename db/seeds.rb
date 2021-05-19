User.destroy_all
Payment.destroy_all
Supplier.destroy_all
Service.destroy_all
Category.destroy_all
ServiceCategory.destroy_all
Order.destroy_all

puts 'Creating Users...'

first_user = User.create!(
  email: 'user@mail.com',
  password: '123456',
  first_name: 'Andrew',
  last_name: 'Velez',
  address: 'Juan Paullier 1018, 11200 Montevideo'
)
second_user = User.create!(
  email: 'user2@mail.com',
  password: '123456',
  first_name: 'Lola',
  last_name: 'Headge',
  address: 'Pte. Gral. Oscar Gestido 2549, 11300 Montevideo'
)

puts 'Creating Payments...'

debit_card = Payment.create!(
  payment_type: 'debit_card',
  user: first_user,
  card_number: 4_110_002_223_335_566,
  secure_number: 345
)
cash = Payment.create!(
  payment_type: 'cash',
  user: second_user
)

puts 'Creating Suppliers...'

first_supplier = Supplier.new(
  name: 'La Pasionaria Cocina',
  address: 'Pte. Gral. Oscar Gestido 2805, 11300 Montevideo, Uruguay',
  description: 'Artesanía pastelera es una empresa dedicada a la elaboracion de catering y postres finos',
  offers: 'Desayunos, almuerzos, dulces',
  phone_number: 1_133_334_444,
  delivery: true
)
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1621000898/Planit/pexels-artem-beliaikin-452740_srubqb.jpg')
first_supplier.photo.attach(io: file, filename: 'first_supplier.jpg', content_type: 'image/jpg')
first_supplier.save!

second_supplier = Supplier.new(
  name: 'La Messeta',
  address: 'Obligado 1317, 11300 Montevideo, Uruguay',
  description: 'Empresa especializada en la elaboracion de pizzasa artesanales',
  offers: 'Desayunos, almuerzos, dulces',
  phone_number: 1_133_334_446,
  delivery: true
)
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1621000890/Planit/pexels-vinicius-benedit-1082343_vlyj7d.jpg')
second_supplier.photo.attach(io: file, filename: 'second_supplier.jpg', content_type: 'image/jpg')
second_supplier.save!

third_supplier = Supplier.new(
  name: 'Medialunas Calentitas',
  address: 'Obligado 917, 11300 Montevideo, Uruguay',
  description: 'Panaderia de calidad',
  offers: 'Desayunos, almuerzos, dulces',
  phone_number: 1_133_334_445,
  delivery: false
)
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1621000894/Planit/pexels-madison-inouye-192933_muyaft.jpg')
third_supplier.photo.attach(io: file, filename: 'third_supplier.jpg', content_type: 'image/jpg')
third_supplier.save!

puts 'Creating Services...'

dinner = Service.create!(
  name: 'Cena gourmet',
  description: 'Cena en 3 pasos gourmet',
  supplier: first_supplier,
  price: 520
)
brunch = Service.create!(
  name: 'Brunch completo',
  description: 'Scones de queso, exprimido de naranja, cafe, medialunas',
  supplier: first_supplier,
  price: 350
)
second_dinner = Service.create!(
  name: 'Cena gourmet',
  description: 'Cena en 3 pasos gourmet',
  supplier: second_supplier,
  price: 540
)
second_brunch = Service.create!(
  name: 'Brunch completo',
  description: 'Scones de queso, exprimido de naranja, cafe, medialunas',
  supplier: second_supplier,
  price: 320
)
breakfast = Service.create!(
  name: 'Desayuno completo',
  description: 'cafe, tortas varias, jugos, mermeladas',
  supplier: third_supplier,
  price: 230
)
lunch = Service.create!(
  name: 'Lunch de tres pasos',
  description: 'Carne de cerdo a las brazas',
  supplier: third_supplier,
  price: 400
)

puts 'Creating Categories...'
require 'open-uri'

tutorial = Category.new(name: 'Tutorial')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620915696/Planit/tutoral_jtzs0w.png')
tutorial.icon.attach(io: file, filename: 'tutorial.png', content_type: 'image/png')
tutorial.save!

bakery = Category.new(name: 'Pasteleria')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912987/Planit/catering_ti6zok.png')
bakery.icon.attach(io: file, filename: 'bakery.png', content_type: 'image/png')
bakery.save!

ft = Category.new(name: 'Foodtrucks')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913006/Planit/foodtrucks_rrm1nc.png')
ft.icon.attach(io: file, filename: 'foodtruck.png', content_type: 'image/png')
ft.save!

drinks = Category.new(name: 'Barras de tragos')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912970/Planit/barra-tragos_tfee5f.png')
drinks.icon.attach(io: file, filename: 'drinks.png', content_type: 'image/png')
drinks.save!

saloon = Category.new(name: 'Salones')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913063/Planit/salones_ftrcgj.png')
saloon.icon.attach(io: file, filename: 'saloon.png', content_type: 'image/png')
saloon.save!

photo = Category.new(name: 'Fotografia')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913015/Planit/fotografia_kxhcxo.png')
photo.icon.attach(io: file, filename: 'photo.png', content_type: 'image/png')
photo.save!

beberage = Category.new(name: 'Bebidas')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912980/Planit/bebidas_g9e0zj.png')
beberage.icon.attach(io: file, filename: 'beberage.png', content_type: 'image/png')
beberage.save!

music = Category.new(name: 'Musica')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913053/Planit/musica_l0ntjs.png')
music.icon.attach(io: file, filename: 'music.png', content_type: 'image/png')
music.save!

party_costums = Category.new(name: 'Cotillon')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912997/Planit/cotillon_vhn93k.png')
party_costums.icon.attach(io: file, filename: 'party_costums.png', content_type: 'image/png')
party_costums.save!

animation = Category.new(name: 'Animacion')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912961/Planit/animacion_hux5uo.png')
animation.icon.attach(io: file, filename: 'animation.png', content_type: 'image/png')
animation.save!

waiter = Category.new(name: 'Mozos')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913044/Planit/mozos_bzurjy.png')
waiter.icon.attach(io: file, filename: 'waiter.png', content_type: 'image/png')
waiter.save!

crockery = Category.new(name: 'Vajilla')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913082/Planit/vajilla_ir8xzh.png')
crockery.icon.attach(io: file, filename: 'crockery.png', content_type: 'image/png')
crockery.save!

security = Category.new(name: 'Seguridad')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913024/Planit/group-18_o1wg3w.png')
security.icon.attach(io: file, filename: 'security.png', content_type: 'image/png')
security.save!

furniture = Category.new(name: 'Mobiliario')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620912961/Planit/animacion_hux5uo.png')
furniture.icon.attach(io: file, filename: 'barratragos.png', content_type: 'image/png')
furniture.save!

catering = Category.new(name: 'Catering')
file = URI.open('https://res.cloudinary.com/eagerworks-planit/image/upload/v1620913034/Planit/group-27_xqylqe.png')
catering.icon.attach(io: file, filename: 'catering.png', content_type: 'image/png')
catering.save!

puts 'Creating service_categories...'

ServiceCategory.create!(service: dinner, category: catering)
ServiceCategory.create!(service: dinner, category: waiter)
ServiceCategory.create!(service: brunch, category: catering)
ServiceCategory.create!(service: brunch, category: bakery)
ServiceCategory.create!(service: brunch, category: ft)
ServiceCategory.create!(service: second_dinner, category: waiter)
ServiceCategory.create!(service: second_brunch, category: ft)
ServiceCategory.create!(service: lunch, category: catering)
ServiceCategory.create!(service: breakfast, category: bakery)
ServiceCategory.create!(service: breakfast, category: catering)

puts 'Creating Orders...'

Order.create!(
  user: first_user,
  service: dinner,
  payment: debit_card,
  quantity: 100,
  delivery_date: Date.current.next_month,
  comments: 'There are 3 vegetarians',
  start_time: 10,
  end_time: 21,
  home_delivery: true,
  status: 'pending'
)
Order.create!(
  user: second_user,
  service: second_brunch,
  payment: cash,
  quantity: 20,
  delivery_date: Date.current.next_week,
  comments: 'Everything needs ketchup',
  start_time: 18,
  end_time: 22,
  home_delivery: true,
  status: 'pending'
)
Order.create!(
  user: first_user,
  service: breakfast,
  payment: cash,
  quantity: 20,
  delivery_date: Date.current.next_week,
  comments: '',
  start_time: 11,
  end_time: 15,
  home_delivery: true,
  status: 'pending'
)

puts 'Seeds done...'
