module Api
  module V1
    class RegistersController < ApplicationController
      before_action :set_company, only: %i[index]

      def index
        register = @company.registers.all
        render json: register, status: :ok
      end

      private

      def set_company
        @company = current_user.company
      rescue StandardError
        head :unauthorized
      end
    end
  end
end
