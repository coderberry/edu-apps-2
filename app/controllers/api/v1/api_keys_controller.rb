module Api
  module V1
    class ApiKeysController < ApplicationController
      before_filter :ensure_authenticated_user
      
      # curl 'http://localhost:3000/api/v1/api_keys' -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4'
      def index
        render json: current_user.api_keys.api.active, status: 200
      end

      def create
        organization_id = params[:api_key].try(:[], :organization_id)
        if organization_id.present?
          organization = Organization.where(id: organization_id).first
          if organization
            if current_user.can_manage?(organization)
              organization.api_keys.map(&:expire)
              api_key = organization.api_keys.active.api.create
              render json: api_key, status: 201
            else
              render json: {}, status: 401 and return
            end
          else
            render json: {}, status: 404 and return
          end
        else
          api_key = current_user.api_keys.active.api.create
          render json: api_key, status: 201
        end
      end

      def destroy
        api_key = current_user.api_keys.api.where(id: params[:id]).first
        if api_key
          api_key.destroy
          head 200
        else
          head 404
        end
      end
    end
  end
end
