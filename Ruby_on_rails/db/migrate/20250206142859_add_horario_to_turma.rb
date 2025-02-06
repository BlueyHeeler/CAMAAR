class AddHorarioToTurma < ActiveRecord::Migration[8.0]
  def change
    add_column :turmas, :horario, :string
  end
end
