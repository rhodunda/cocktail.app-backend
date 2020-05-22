class Cocktail < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :cocktailIngredients
    has_many :users, through: :reviews
    has_many :users, through: :favorites
    has_many :ingredients, through: :userIngredients
end
