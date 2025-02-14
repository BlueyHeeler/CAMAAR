class Matricula < ApplicationRecord
  belongs_to :estudante, class_name: "User", foreign_key: "user_id"
  belongs_to :turma
end
