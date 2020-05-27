class Api::V1::FavoritesController < ApplicationController
    def index
        favorites = Favorite.all
        render json: favorites
    end 

    def show
        favorite = Favorite.find(params[:id])
        render json: favorite
    end 

    def create
        if !params[:user_id]
            return
        end
        
        if !cocktail_params[:id]
            cocktail = Cocktail.create_cocktail_with_ingredients(cocktail_params)
        else
            cocktail = Cocktail.find_by(id: cocktail_params[:id])
        end

        favorite = Favorite.find_by(user_id: params[:user_id], cocktail_id: cocktail.id)
        if favorite
            favorite.destroy
            favorite_status = 'deleted'
        else
            favorite = Favorite.create(user_id: params[:user_id], cocktail_id: cocktail.id)
            favorite_status = 'created'
        end

        render json: cocktail.as_json(include: [:ingredients, :cocktailIngredients, :reviews])
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:id, :name, :image, :instructions, ingredients: [:name], cocktailIngredients: [:measure])
    end
end
