# frozen_string_literal: true

# Service to download ftp files from the server
class Service < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :service_categories
  has_many :categories, through: :service_category
end
