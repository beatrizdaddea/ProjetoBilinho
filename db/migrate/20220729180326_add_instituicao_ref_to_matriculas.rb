class AddInstituicaoRefToMatriculas < ActiveRecord::Migration[7.0]
  def change
    add_reference :matriculas, :instituicao, null: false, foreign_key: true
  end
end
