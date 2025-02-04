class RenameMateriasToMateriumInTurmas < ActiveRecord::Migration[8.0]
  def change
    remove_reference :turmas, :materia
    add_reference :turmas, :materium, null: false, foreign_key: true
  end
end