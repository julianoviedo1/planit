# frozen_string_literal: true

# Service to download ftp files from the server
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :service

  enum status: { pending: 0, recived: 1, completed: 2, cancelled: 3 }
end
