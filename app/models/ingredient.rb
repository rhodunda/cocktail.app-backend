class Ingredient < ApplicationRecord
    has_many :cocktailIngredients
    has_many :cocktails, through: :cocktailIngredients
end
