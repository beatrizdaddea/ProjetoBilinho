class AddMatriculaRefToFatura < ActiveRecord::Migration[7.0]
  def change
    add_reference :faturas, :matricula, null: false, foreign_key: true
  end
end
