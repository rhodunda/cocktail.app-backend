class Api::V1::ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews
    end 

    def show
        review = Review.find(params[:id])
        render json: review
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

        review = Review.new(review_params)
        review.user_id = params[:user_id]
        review.cocktail_id = cocktail.id

        if review.save
            render json: { cocktail: cocktail.as_json(include: [:ingredients, :cocktailIngredients, :reviews]), review: review.as_json }
        else
            render json: { errors: review.errors.full_messages }
        end
    end 

    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: review
    end

    def get_user_email
        review = Review.find_by(id: review_params[:id])
        render json: review.user
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:id, :name, :image, :instructions, ingredients: [:name], cocktailIngredients: [:measure])
    end

    def review_params
        params.require(:review).permit(:id, :rating, :content)
    end
end
