class CreateMatriculas < ActiveRecord::Migration[7.0]
  def change
    create_table :matriculas do |t|
      t.float :valor_total_curso
      t.integer :quantidade_faturas
      t.integer :dia_vencimento
      t.string :nome_curso

      t.timestamps
    end
  end
end
