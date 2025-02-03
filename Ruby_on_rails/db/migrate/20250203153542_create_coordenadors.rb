class CreateCoordenadors < ActiveRecord::Migration[8.0]
  def change
    create_table :coordenadors do |t|
      t.references :departamento, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
