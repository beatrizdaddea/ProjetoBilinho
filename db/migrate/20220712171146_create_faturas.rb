class CreateFaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :faturas do |t|
      t.float :valor_fatura
      t.date :data_vencimento
      t.string :status

      t.timestamps
    end
  end
end
