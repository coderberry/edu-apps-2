module Api
  module V1
    class LtiAppsController < ApplicationController
      def index
        render json: LtiApp.all
      end

      def show
        app = LtiApp.where(short_name: params[:id]).first
        if app
          render json: app
        else
          render json: {}, status: 404
        end
      end
    end
  end
end