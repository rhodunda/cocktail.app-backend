class User < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :cocktails, class_name: 'Cocktail', foreign_key: 'creator_id'
end
