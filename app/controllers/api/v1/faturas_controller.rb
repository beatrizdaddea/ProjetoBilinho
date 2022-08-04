module Api
    module V1
      class FaturasController < ApplicationController

        # Listar as faturas disponiveis 
        def index
          fatura = Fatura.order('created_at DESC')
          render json: { status: 'SUCCESS', message: 'Faturas Carregadas com Sucesso', data: fatura }, status: :ok
        end

        # Listar faturas passando ID
        def show
            fatura = Fatura.find(params[:id])
            render json: { status: 'SUCCESS', message: 'Faturas Carregadas com Sucesso', data: fatura }, status: :ok
        end

        # Deletar as faturas
        def destroy
          fatura = Fatura.find(params[:id])
          fatura.destroy
          render json: { status: 'SUCCESS', message: 'Fatura Deletada!', data: fatura }, status: :ok
        end

        private

        def fatura_params
          params.permit(:valor_fatura, :data_vencimento, :status, :matricula_id)
        end

      end
    end
  end
