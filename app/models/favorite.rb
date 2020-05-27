class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :cocktail

    def self.create_cocktail(params)
        cocktail_ingredients = params[:cocktailIngredients]
        ingredients = params[:ingredients]

        cocktail = Cocktail.new(name: params[:name], image: params[:image], instructions: params[:instructions])
        if !cocktail.save
            return
        end

        ingredients.length.times do |index|
            ingredient = Ingredient.find_by(name: ingredients[index][:name])
            if !ingredient
                ingredient = Ingredient.new(name: ingredients[index][:name])
                ingredient.save
            end
            
            if cocktail.id && ingredient.id
                CocktailIngredient.create(cocktail: cocktail, ingredient: ingredient, measure: cocktail_ingredients[index][:measure])
            end
        end

        cocktail
    end
end
