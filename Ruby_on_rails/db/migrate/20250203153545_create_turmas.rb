class CreateTurmas < ActiveRecord::Migration[8.0]
  def change
    create_table :turmas do |t|
      t.string :codigo
      t.string :semestre
      t.references :materia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
