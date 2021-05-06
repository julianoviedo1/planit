# frozen_string_literal: true

# Service to download ftp files from the server
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :service

  enum status: { pending: 0, in_process: 1, performed: 2, cancelled: 3, refunded: 4 }
end
