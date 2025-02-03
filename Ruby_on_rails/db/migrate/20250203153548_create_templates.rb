class CreateTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :templates do |t|
      t.string :nome
      t.string :publico_alvo
      t.string :semestre

      t.timestamps
    end
  end
end
