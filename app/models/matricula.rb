class Matricula < ApplicationRecord
    belongs_to :aluno
    belongs_to :instituicao
    has_many :faturas, dependent: :destroy # quando uma matricula for excluida as faturas relacionadas a elas tbm serão

    validates :valor_total_curso, presence: true, numericality: { greater_than: 0 }
	validates :quantidade_faturas, presence: true,  numericality: { greater_than_or_equal_to: 1 }
    validates :dia_vencimento, presence: true,numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
    validates :nome_curso, presence: true

    after_create :criar_fatura

    def criar_fatura 
        valor_fatura = valor_total_curso / quantidade_faturas

        data_atual = DateTime.now.to_date 
        # now: saber o a data no momento 
        # to_date: retorna um objeto data 
        dia_atual = data_atual.day

        if dia_vencimento <= dia_atual
            # primeira fatura vai para o proximo mês 
            data_vencimento = data_atual.next_month.strftime("#{dia_vencimento}/%m/%Y").to_date
          else
            # primeira fatura vai para o mes atual
            data_vencimento = data_atual.strftime("#{dia_vencimento}/%m/%Y").to_date # data_vencimento -> data da primeira fatura apenas
          end
    end 

    def atualizar_fatura  

    end 

end


