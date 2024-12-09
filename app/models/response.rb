class Response < ApplicationRecord
  belongs_to :form

  enum :status, { pending: "pediente", completed: "Terminado", failed: "fallido" }

  validates :status, presence: true,
            inclusion: { in: statuses.keys }
end
