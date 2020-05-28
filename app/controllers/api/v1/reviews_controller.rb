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
        review = Review.new(user_id: params['user_id'], cocktail_id: params['cocktail_id'], rating: params['rating'], content: params['content'])
        review.save
        render json: review
    end 

    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: review
    end
end
