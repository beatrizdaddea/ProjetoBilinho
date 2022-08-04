Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
        resources :instituicaos
        resources :alunos
        resources :matriculas
        resources :faturas
  	end
  end
end 

