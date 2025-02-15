class Departamento < ApplicationRecord
    has_many :materiums, dependent: :destroy
end
