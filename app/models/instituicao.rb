class Instituicao < ApplicationRecord 
    
    has_many :matriculas, dependent: :destroy
    validates :nome, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 14 }
    validates :tipo, presence: true, inclusion: { in: %w[Creche Escola Universidade] }

end 
