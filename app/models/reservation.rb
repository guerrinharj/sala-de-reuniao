class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validates :description, presence: true
end
