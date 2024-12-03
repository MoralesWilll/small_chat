class Form < ApplicationRecord
    has_one :response, dependent: :destroy

    validates :name, presencce: true
end
