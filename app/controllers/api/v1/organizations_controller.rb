module Api
  module V1
    class OrganizationsController < ApplicationController
      before_filter :ensure_authenticated_user

      # curl 'http://localhost:3000/api/v1/organizations' -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4'
      def index
        render json: Organization.all
      end

      # curl 'http://localhost:3000/api/v1/organizations/1' -H 'Authorization: Bearer 40a3d4f1f54bc2f90068242b826d08c4'
      def show
        organization = current_user.organizations.find(params[:id])
        if organization
          render json: organization, status: 200
        else
          head 404
        end
      end

      def create
        user = current_user
        organization = user.organizations.create(organization_params)
        if organization.new_record?
          render json: { errors: organization.errors.messages }, status: 422
        else
          organization.memberships.where(user_id: user.id).first.update_attribute(:is_admin, true)
          render json: organization, status: 201
        end
      end

      def update
        organization = current_user.organizations.find(params[:id])
        if current_user.can_manage?(organization)
          if organization.update_attributes(organization_params)
            render json: organization, status: 201
          else
            render json: { errors: organization.errors.messages }, status: 422
          end
        else
          render json: {}, status: 401
        end
      end

      def destroy
        organization = Organization.where(id: params[:id]).first
        if organization
          organization.destroy
          render json: {}, status: 200
        else
          head 404
        end
      end

      def add_member
        organization = Organization.find(params[:id])
        if current_user.can_manage?(organization)
          user = User.where(email: params[:email]).first
          if user
            membership = organization.memberships.where(:user_id => user.id).first
            if !membership
              membership = Membership.create!(user_id: user.id, organization_id: organization.id, is_admin: params[:is_admin])
              render json: membership, status: 201
            else
              render json: { message: 'User already belongs to this organization' }, status: 422
            end
          else
            render json: { message: 'User does not exist' }, status: 422
          end
        else
          render json: {}, status: 401
        end
      end

      private

      def organization_params
        params.require(:organization).permit(:name)
      end

    end
  end
end
