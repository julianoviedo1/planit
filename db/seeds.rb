# frozen_string_literal: true

User.destroy_all
Payment.destroy_all

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

Payment.create!(
  payment_type: 'debit_card',
  user: first_user,
  card_number: 4_110_002_223_335_566,
  secure_number: 345
)

Payment.create!(
  payment_type: 'cash',
  user: second_user
)

puts 'Creating Services...'
  