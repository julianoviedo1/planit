# frozen_string_literal: true

# Service to download ftp files from the server
class Payment < ApplicationRecord
  belongs_to :user
  has_many :orders

  enum type: { cash: 0, credit_card: 1, debit_card: 2, wire: 3, bank_check: 4 }
end
