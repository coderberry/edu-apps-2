module Api
  module V1
    class UsersController < ApplicationController
      before_filter :ensure_authenticated_user, except: [:create]

      # curl 'http://localhost:3000/api/v1/users' -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4'
      def index
        render json: User.all
      end

      # curl 'http://localhost:3000/api/v1/users/1' -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4'
      def show
        render json: User.find(params[:id])
      end

      # curl 'http://localhost:3000/api/v1/users' --data 'user%5Bname%5D=Brad&user%5Bemail%5D=brad%40instructure.com&user%5Bpassword%5D=secret&user%5Bpassword_confirmation%5D=secret'
      def create
        user = User.create(user_params.merge(is_activated: true))
        if user.new_record?
          render json: { errors: user.errors.messages }, status: 422
        else
          render json: user.session_api_key, status: 201
        end
      end

      # Limit the update to the name only for now
      # curl 'http://localhost:3000/api/v1/users/1' -X PUT -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4' --data-binary '{"user":{"name":"Eric Berry","email":"cavneb@gmail.com"}}'
      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params.slice(:name))
          render json: {}, status: 200
        else
          render json: { errors: user.errors.messages }, status: 422
        end
      end

      # curl 'http://localhost:3000/api/v1/users/update_password' -X PUT -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4' --data 'existing_password=CURRENT&password=NEW&password_confirmation=NEW'
      def update_password
        user = current_user
        if user.authenticate(params[:existing_password])
          if user.update_attributes({
              password: params[:password],
              password_confirmation: params[:password_confirmation]
            })
            render json: {}, status: 200
          else
            render json: { errors: user.errors.messages }, status: 422
          end
        else
          render json: {}, status: 401
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :url, :avatar_url)
      end
    end
  end
end