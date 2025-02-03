class CreateQuestaoOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :questao_options do |t|
      t.string :nome
      t.text :texto
      t.references :questao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
