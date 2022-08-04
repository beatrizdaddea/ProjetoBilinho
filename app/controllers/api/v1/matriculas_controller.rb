module Api
    module V1
      class MatriculasController < ApplicationController

        # Listar todas as matriculas
        def index
          matricula = Matricula.order('created_at DESC')
          render json: { status: 'SUCCESS', message: 'Matrículas Carregadas com Sucesso ', data: matricula },
                 status: :ok
        end
  
        # Listar matricula passando ID
        def show
          matricula = Matricula.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Matrícula Carregada com Sucesso', data: matricula },
                 status: :ok
        end
  
        # Criar uma nova matricula 
        def create
          matricula = Matricula.new(matricula_params)
          if matricula.save
            render json: { status: 'SUCCESS', message: 'Matricula Criada com Sucesso', data: matricula },
                   status: :ok
          else
            render json: { status: 'ERROR', message: 'Não foi possível criar a Matrícula', data: matricula.errors },
                   status: :unprocessable_entity
          end
        end
  
        # Deletar uma matricula de uma instituição
        def destroy
          matricula = Matricula.find(params[:id])
          matricula.destroy
          render json: { status: 'SUCCESS', message: 'Matricula Deletada com Sucesso', data: matricula },
                 status: :ok
        end
  
        # Atualizar uma matricula
              def update
                  matricula = Matricula.find(params[:id])
                  if matricula.update(matricula_params)
                      render json: {status: 'SUCCESS', message:'Matricula Atualizada com Sucesso', data:matricula},status: :ok
          else
                      render json: {status: 'ERROR', message:'Não foi possível atualizar a Matrícula', data:matricula.errors}, status: :unprocessable_entity
                  end
              end
  
        # Parametros de matricula aceitos
        private

        def matricula_params
          params.permit(:valor_total_curso, :quantidade_faturas, :dia_vencimento, :nome_curso, :aluno_id, :instituicao_id)
        end

      end
    end
  end