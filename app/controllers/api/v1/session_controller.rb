module Api
  module V1
    class SessionController < ApplicationController

      # curl 'http://localhost:3000/api/v1/session' --data 'email=joe%40example.com&password=secret'
      def create
        user = User.where(email: params[:email]).first
        if user
          if user.authenticate(params[:password])
            user.clear_expired_api_keys
            render json: user.session_api_key, status: 201
          else
            render json: {}, status: 401
          end
        else
          head 404
        end
      end
    end
  end
end