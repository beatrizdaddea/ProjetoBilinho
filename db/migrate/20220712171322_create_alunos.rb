class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :genero
      t.string :meio_pagamento
      t.date :data_nascimento

      t.timestamps
    end
  end
end
