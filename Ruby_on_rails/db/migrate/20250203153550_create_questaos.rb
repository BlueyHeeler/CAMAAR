class CreateQuestaos < ActiveRecord::Migration[8.0]
  def change
    create_table :questaos do |t|
      t.string :nome
      t.text :texto
      t.string :tipo
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
