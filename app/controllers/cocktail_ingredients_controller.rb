class CocktailIngredientsController < ApplicationController
    def index
        cocktails = Cocktail.all
        render json: cocktails
    end 

    def show
        cocktail = Cocktail.find(params[:id])
        render json: cocktail
    end 

    def create
        cocktail = Cocktail.new(name: params['name'], image_url: params['image_url'])
        cocktail.save
        render json: cocktail
    end 
end
