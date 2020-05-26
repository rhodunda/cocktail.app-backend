class Api::V1::CocktailsController < ApplicationController
    def show
        cocktail = Cocktail.find(params[:id])
        render json: cocktail, include: :creator
    end 

    def create
        cocktail = Cocktail.new(name: params['name'], image: params['image'])
        cocktail.save
        render json: cocktail
    end

    def search_by_char
        cocktails = Cocktail.cocktails_by_char(params['q'])
        render json: cocktails, include: [:ingredients]
    end

    def search_by_name
        cocktails = Cocktail.cocktails_by_name(params['q'])
        render json: cocktails
    end
end
