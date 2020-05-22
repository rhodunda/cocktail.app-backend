class FavoritesController < ApplicationController
    def index
        favorites = Favorite.all
        render json: favorites
    end 

    def show
        favorite = Favorite.find(params[:id])
        render json: favorite
    end 

    def create
        favorite = Favorite.new(user_id: params['user_id'], cocktail_id: params['cocktail_id'])
        favorites.save
        render json: favorite
    end 

    def destroy
        favorite = Favorite.find(params[:id])
        favorites.destroy
        render json: favorite
    end
end
