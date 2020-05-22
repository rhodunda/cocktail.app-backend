class User < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :cocktails, through: :reviews
  has_many :cocktails, through: :favorites
  # has_secure_password
end
