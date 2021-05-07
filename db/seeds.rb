User.destroy_all
Payment.destroy_all
Supplier.destroy_all
Service.destroy_all
Category.destroy_all
ServiceCategory.destroy_all
Order.destroy_all

puts 'Creating Users...'

first_user = User.create!(
  email: 'andrew@mail.com',
  password: '123456',
  first_name: 'Andrew',
  last_name: 'Velez',
  address: 'Juan Paullier 1018, 11200 Montevideo'
)
second_user = User.create!(
  email: 'lolaheadge@mail.com',
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

first_supplier = Supplier.create!(
  name: 'La Pasionaria Cocina',
  address: 'Pte. Gral. Oscar Gestido 2805, 11300 Montevideo, Uruguay',
  description: 'Artesanía pastelera es una empresa dedicada a la elaboracion de catering y postres finos',
  phone_number: 1_133_334_444
)
second_supplier = Supplier.create!(
  name: 'La Messeta',
  address: 'Obligado 1317, 11300 Montevideo, Uruguay',
  description: 'Empresa de alta trayectoria dedicada a la elaboracion de postres finos',
  phone_number: 1_133_334_444
)

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

puts 'Creating Categories...'

bakery = Category.create!(name: 'Pateleria')
ft = Category.create!(name: 'Foodtrucks')
Category.create!(name: 'Barras de tragos')
Category.create!(name: 'Salones')
Category.create!(name: 'Fotografia')
Category.create!(name: 'Bebidas')
Category.create!(name: 'Musica')
Category.create!(name: 'Cotillon')
Category.create!(name: 'Animacion')
mozos = Category.create!(name: 'Mozos')
Category.create!(name: 'Vajilla')
Category.create!(name: 'Seguridad')
Category.create!(name: 'Mobiliario')
catering = Category.create!(name: 'Catering')

puts 'Creating service_categories...'

ServiceCategory.create!(service: dinner, category: catering)
ServiceCategory.create!(service: dinner, category: mozos)
ServiceCategory.create!(service: brunch, category: catering)
ServiceCategory.create!(service: brunch, category: bakery)
ServiceCategory.create!(service: brunch, category: ft)
ServiceCategory.create!(service: second_dinner, category: mozos)
ServiceCategory.create!(service: second_brunch, category: ft)

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

puts 'Seeds done...'
