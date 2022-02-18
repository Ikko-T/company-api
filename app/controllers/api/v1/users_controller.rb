class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: %i[index create]

  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  def show
    render json: @user, except: [:created_at, :updated_at]
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, except: [:created_at, :updated_at]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :company, :email, :phone_number, :twitter, :message, :gender)
  end
end
