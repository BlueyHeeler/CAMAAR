class ChangeQuestao < ActiveRecord::Migration[8.0]
  def change
    remove_column :questaos, :nome, :string
    add_column :questaos, :enunciado, :text
    remove_column :questaos, :tipo, :string
  end
end
