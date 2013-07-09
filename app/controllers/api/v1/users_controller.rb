module Api
  module V1
    class UsersController < ApplicationController
      before_filter :ensure_authenticated_user, except: [:create]

      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      def create
        user = User.create(user_params)
        if user.new_record?
          render json: { errors: user.errors.messages }, status: 422
        else
          render json: user.session_api_key, status: 201
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end