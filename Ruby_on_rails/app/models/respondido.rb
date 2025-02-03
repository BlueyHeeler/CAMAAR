class Respondido < ApplicationRecord
  belongs_to :questionario
  belongs_to :user
end
