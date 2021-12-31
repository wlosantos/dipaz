module Api
  module V1
    class RegistersController < ApplicationController
      before_action :set_company, only: %i[index]
      before_action :set_register, only: %i[show]

      def index
        register = @company.registers.all
        render json: register, status: :ok
      end

      def show
        render json: @register, status: :ok
      end

      private

      def set_company
        @company = current_user.company
      rescue StandardError
        head :unauthorized
      end

      def set_register
        @register = Register.find(params[:id])
      rescue StandardError
        head :unprocessable_entity
      end
    end
  end
end
