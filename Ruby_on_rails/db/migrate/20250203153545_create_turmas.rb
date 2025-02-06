class CreateTurmas < ActiveRecord::Migration[8.0]
  def change
    create_table :turmas do |t|
      t.string :codigo
      t.string :semestre
      t.string :horario
      t.references :materium, null: false, foreign_key: true  # Changed from materia to materium

      t.timestamps
    end
  end
end
