class CreateResposta < ActiveRecord::Migration[8.0]
  def change
    create_table :resposta do |t|
      t.string :valor
      t.references :questao, null: false, foreign_key: true
      t.references :questionario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
