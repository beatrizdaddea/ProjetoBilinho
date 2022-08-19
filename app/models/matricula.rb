class Matricula < ApplicationRecord
    belongs_to :aluno
    belongs_to :instituicao
    has_many :faturas, dependent: :destroy # quando uma matricula for excluida as faturas relacionadas a elas tbm serão

    validates :valor_total_curso, presence: true, numericality: { greater_than: 0 }
	validates :quantidade_faturas, presence: true,  numericality: { greater_than_or_equal_to: 1 }
    validates :dia_vencimento, presence: true,numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
    validates :nome_curso, presence: true

    after_create :criar_fatura
    after_update :excluir_faturas

    def criar_fatura 
        valor_fatura = valor_total_curso / quantidade_faturas

        data = DateTime.now.to_date 
        dia_atual = data.day # ver o dia que está baseada na data 

        if dia_vencimento >= dia_atual
            # primeira fatura vai para o mes atual
            data_vencimento = data.strftime("#{dia_vencimento}/%m/%Y").to_date
        else
             # primeira fatura vai para o proximo mês 
            data_vencimento = data.next_month.strftime("#{dia_vencimento}/%m/%Y").to_date
        end

        Fatura.create(valor_fatura: valor_fatura, data_vencimento: data_vencimento, matricula_id: id, status: 'Aberta')

        faturas_criadas = 1 # controle de quantas faturas serão criadas 

        while faturas_criadas < quantidade_faturas
            dia_vencimento = Date.new(data_vencimento.year, data_vencimento.month, data_vencimento.day).next_month(faturas_criadas) # vai jogar para o próximo mês 
            faturas_criadas += 1
            # Usa a Classe da Fatura para criação de faturas 
            Fatura.create(valor_fatura: valor_fatura, data_vencimento: dia_vencimento, matricula_id: id, status: 'Aberta')
        end  
    end 

    def excluir_faturas  
        faturas.map(&:destroy)
        criar_fatura # chama o metodo de criaçao de faturas
    end 

end


