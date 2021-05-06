# frozen_string_literal: true

# Service to download ftp files from the server
class Category < ApplicationRecord
  has_many :service_categories
  has_many :services, through: :service_category
end
