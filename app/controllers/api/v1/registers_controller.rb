module Api
  module V1
    class RegistersController < ApplicationController
      before_action :set_company, only: %i[index create]
      before_action :set_register, only: %i[show]

      def index
        register = @company.registers.all
        render json: register, status: :ok
      end

      def show
        render json: @register, status: :ok
      end

      def create
        register = @company.registers.build(params_register)
        if register.save
          render json: register, status: :created
        else
          render json: { errors: register.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        register = Register.find(params[:id])

        if register.update(params_register)
          render json: register, status: :ok
        else
          render json: { errors: register.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        register = Register.find(params[:id])
        head :not_found if register.destroy
      rescue StandardError
        head :unprocessable_entity
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

      def params_register
        params.require(:register).permit(:name, :birthday, :cpf, :rg, :accession_at, :plan, :status)
      end
    end
  end
end
