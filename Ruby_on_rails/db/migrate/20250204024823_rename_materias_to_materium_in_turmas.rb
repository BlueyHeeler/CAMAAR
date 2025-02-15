class RenameMateriasToMateriumInTurmas < ActiveRecord::Migration[8.0]
  def change
    remove_reference :turmas, :materia, if_exists: true
    unless column_exists?(:turmas, :materium_id)
      add_reference :turmas, :materium, null: false, foreign_key: true
    end
  end
end