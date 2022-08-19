class Aluno < ApplicationRecord

  has_many :matriculas, dependent: :destroy #  ao excluir um aluno as matriculas relacionadas a esse aluno tbm serão excluidas
  
  validates :nome, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
  validates :telefone, numericality: { only_integer: true }
  validates :genero, presence: true, inclusion: { in: %w[M F NB] }
  validates :meio_pagamento, presence: true, inclusion: { in: %w[Boleto Cartão] }

end 