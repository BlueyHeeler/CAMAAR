class AddProfessorToQuestionario < ActiveRecord::Migration[8.0]
  def change
    add_reference :questionarios, :user, foreign_key: true
  end
end
