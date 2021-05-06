# frozen_string_literal: true

# Service to download ftp files from the server
class Supplier < ApplicationRecord
  has_many :services
end
