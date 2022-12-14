module Api
  module V1
    class AlunosController < ApplicationController
      
      # Listar todos os alunos
      def index
        aluno = Aluno.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Alunos Carregados com Sucesso', data: aluno }, status: :ok
      end

      # Listar aluno passando ID
      def show
        aluno = Aluno.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Aluno Carregado com Sucesso', data: aluno }, status: :ok
      end

      # Criar um novo aluno
      def create
        aluno = Aluno.new(aluno_params)
        if aluno.save
          render json: { status: 'SUCCESS', message: 'Aluno Cadastrado com Sucesso', data: aluno }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Não foi possível Cadastrar o Aluno', data: aluno.errors }, status: :unprocessable_entity
        end
      end

      # Deletar instituição
      def destroy
        aluno = Aluno.find(params[:id])
        aluno.destroy
        render json: { status: 'Aluno Deletado!', message: 'Aluno Deletado  com Sucesso', data: aluno }, status: :ok
      end

      # Atualizar um Aluno
			def update
				aluno = Aluno.find(params[:id])
				if aluno.update(aluno_params)
					render json: {status: 'SUCCESS', message:'Aluno Atualizado  com Sucesso', data:aluno},status: :ok
        else
					render json: {status: 'ERROR', message:'Não foi possível atualizar o Aluno', data:aluno.errors}, status: :unprocessable_entity
				end
			end

      # Parametros aceitos
      private

      def aluno_params
        params.permit(:nome, :cpf, :data_nascimento, :telefone, :genero, :meio_pagamento)
      end
    end
  end
end