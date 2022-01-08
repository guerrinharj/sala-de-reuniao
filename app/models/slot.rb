class Slot < ApplicationRecord
  has_one :reservation, dependent: :destroy

  validates :day, presence: true
  validates :hour, presence: true
  validates :week, presence: true
end
