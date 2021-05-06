# frozen_string_literal: true

# Service to download ftp files from the server
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payments, dependent: :destroy
  has_many :orders, dependent: :destroy
end
