class Questionario < ApplicationRecord
  belongs_to :turma
  belongs_to :template
end
