class Cocktail < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :cocktailIngredients
    has_many :ingredients, through: :cocktailIngredients
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: true
end
