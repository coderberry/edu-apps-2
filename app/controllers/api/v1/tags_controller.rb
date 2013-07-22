module Api
  module V1
    class TagsController < ApplicationController
      def index
        render json: Tag.all
      end

      def show
        tag = Tag.where(id: params[:id]).first
        if tag
          render json: tag
        else
          render json: {}, status: 404
        end
      end
    end
  end
end
