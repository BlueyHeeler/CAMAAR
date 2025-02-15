class AddHorarioToTurma < ActiveRecord::Migration[8.0]
  def change
    # Adiciona a coluna somente se ela não existir
    unless column_exists?(:turmas, :horario)
      add_column :turmas, :horario, :string
    end
  end
end
