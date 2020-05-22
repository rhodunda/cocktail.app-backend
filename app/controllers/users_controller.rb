class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update]
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end 

  def login
    user = User.find_by(name: params[:name], password: params[:email])
        if user != nil
            render json: user
        else 
            render json: {message: 'loggin Failed'}
        end
  end 

  def update
    user.update(user_params)
    if user.save
      render json: user, status: :accepted
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def find_note
    user = User.find(params[:id])
  end
end
