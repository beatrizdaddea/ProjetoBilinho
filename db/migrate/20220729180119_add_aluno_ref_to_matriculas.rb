class AddAlunoRefToMatriculas < ActiveRecord::Migration[7.0]
  def change
    add_reference :matriculas, :aluno, null: false, foreign_key: true
  end
end
