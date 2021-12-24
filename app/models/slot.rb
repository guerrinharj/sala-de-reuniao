class Slot < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :day, presence: true
  validates :hour, presence: true
  validates :week, presence: true
end
