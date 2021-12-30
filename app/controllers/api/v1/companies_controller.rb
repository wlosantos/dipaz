module Api
  module V1
    # Actions companies
    class CompaniesController < ApplicationController
      def index
        company = Company.first
        if company.active?
          render json: company, status: :ok
        else
          render json: { warning: 'Company blocked. Contact support!' }, status: :unauthorized
        end
      end
    end
  end
end
