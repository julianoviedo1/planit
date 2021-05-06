# frozen_string_literal: true

# Service to download ftp files from the server
class ServiceCategory < ApplicationRecord
  belongs_to :service
  belongs_to :category
end
