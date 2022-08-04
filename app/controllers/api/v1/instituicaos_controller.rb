module Api
	module V1
	  class InstituicaosController < ApplicationController
		
		# Listar todas as instituições
		def index
		  instituicao = Instituicao.order('created_at DESC')
		  render json: { status: 'Instituições carregadas', message: 'Instituições Carregadas com Sucesso', data: instituicao },
			status: :ok
		end
  
		# Listar instituição passando ID
		def show
		  instituicao = Instituicao.find(params[:id])
		  render json: { status: 'Instituição carregado', message: 'Instituição Carregado com Sucesso ', data: instituicao },
				 status: :ok
		end
  
		# Criar uma nova instituição
		def create
		  instituicao = Instituicao.new(instituicao_params)
		  if instituicao.save
			render json: { status: 'Instituição criada', message: 'Instituição Criada com Sucesso', data: instituicao },
				   status: :ok
		  else
			render json: { status: 'ERROR', message: 'Não foi possível criar a Instituição', data: instituicao.errors },
				   status: :unprocessable_entity
		  end
		end
  
		# Deletar instituição
		def destroy
		  instituicao = Instituicao.find(params[:id])
		  instituicao.destroy
		  render json: { status: 'Instituição Deletada', message: 'Instituição Deletada com Sucesso', data: instituicao },
				 status: :ok
		end
  
		# Atualizar uma Instituição de ensino 
			  def update
				  instituicao = Instituicao.find(params[:id])
				  if instituicao.update(instituicao_params)
					  render json: {status: 'SUCCESS', message:'Instituição Atualizada com Sucesso', data:instituicao},status: :ok
		  else
					  render json: {status: 'ERROR', message:'Não foi possível atualizar a Instituição', data:instituicao.errors}, status: :unprocessable_entity
				  end
			  end
  
		# Parametros da instituições aceitas 
		
		private
  
		def instituicao_params
		  params.permit(:nome, :cnpj, :tipo)
		end


	  end
	end
  end