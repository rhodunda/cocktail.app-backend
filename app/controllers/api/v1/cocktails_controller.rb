class Api::V1::CocktailsController < ApplicationController
    def show
        cocktail = Cocktail.find(params[:id])
        render json: cocktail.as_json(include: :creator)
    end 

    def create
        cocktail = Cocktail.new(name: params['name'], image: params['image'])
        cocktail.save
        render json: cocktail
    end

    def search_by_char
        cocktails = Cocktail.cocktails_by_char(params['q'])
        render json: cocktails.as_json(include: [:ingredients, :cocktailIngredients])
    end

    def search_by_name
        cocktails = Cocktail.cocktails_by_name(params['q'])
        render json: cocktails.as_json(include: [:ingredients, :cocktailIngredients])
    end

    def search_by_ingredient
        cocktails = Cocktail.cocktails_by_ingredient(params['q'])
        render json: cocktails.as_json(include: [:ingredients, :cocktailIngredients])
    end

    def is_favorite?
        favorite = Favorite.find_by(user_id: params[:user_id], cocktail_id: params[:cocktail_id])
        if favorite
            render json: true
        else
            render json: false
        end
    end
end
