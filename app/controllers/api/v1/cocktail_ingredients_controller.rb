class Api::V1::CocktailIngredientsController < ApplicationController
    def index
        cocktail_ingredients = CocktailIngredient.all
        render json: cocktail_ingredients.as_json(include: [:cocktail, :ingredient])
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
