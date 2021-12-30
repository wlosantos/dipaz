module Api
  module V1
    # Actions companies
    class CompaniesController < ApplicationController
      before_action :set_company, only: %i[update]
      def index
        company = Company.first
        if company.active?
          render json: company, status: :ok
        else
          render json: { warning: 'Company blocked. Contact support!' }, status: :unauthorized
        end
      end

      def update
        if @company.blocked?
          render json: { warning: 'Company blocked. Contact support!' }, status: :unauthorized
        elsif @company.update(params_company)
          render json: @company, status: :ok
        else
          render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def params_company
        params.require(:company).permit(:name, :cnpj, :domain)
      end
    end
  end
end
