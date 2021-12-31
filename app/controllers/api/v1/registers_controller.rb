module Api
  module V1
    class RegistersController < ApplicationController
      before_action :set_company, only: %i[index create]
      before_action :set_register, only: %i[show update destroy]

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
        if @register.update(params_register)
          render json: @register, status: :ok
        else
          render json: { errors: @register.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @register.destroy
          head :no_content
        else
          head :unprocessable_entity
        end
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
