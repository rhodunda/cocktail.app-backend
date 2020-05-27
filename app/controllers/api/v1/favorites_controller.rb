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
            cocktail = Favorite.create_cocktail(cocktail_params)
        else
            cocktail = Cocktail.find_by(id: cocktail_params[:id])
        end

        favorite = Favorite.find_by(user_id: params[:user_id], cocktail_id: cocktail.id)
        if favorite
            favorite.destroy
            render json: nil
        else
            favorite = Favorite.create(user_id: params[:user_id], cocktail_id: cocktail.id)
            render json: favorite
        end
    end 

    def destroy
        favorite = Favorite.find(params[:id])
        favorites.destroy
        render json: favorite
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:id, :name, :image, :instructions, ingredients: [:name], cocktailIngredients: [:measure])
    end
end
