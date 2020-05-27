class Api::V1::CocktailIngredientsController < ApplicationController
    def index
<<<<<<< HEAD
        cocktails = Cocktail.all
        render json: cocktails
        
=======
        cocktail_ingredients = CocktailIngredient.all
        render json: cocktail_ingredients.as_json(include: [:cocktail, :ingredient])
>>>>>>> 19715e221504569a521c3af293ffce768df50d64
    end 

    def show
        cocktail_ingredient = CocktailIngredient.find(params[:id])
        render json: cocktail_ingredient.as_json(include: [:cocktail, :ingredient])
    end 

    def create
        cocktail = Cocktail.new(name: params['name'], image_url: params['image_url'])
        cocktail.save
        render json: cocktail
    end 
end
