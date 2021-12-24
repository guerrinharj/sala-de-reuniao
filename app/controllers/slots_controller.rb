class SlotsController < ApplicationController
  before_action :set_dayshours

  def index
    @user = current_user
    @reservations = Reservation.all
    @slots = Slot.where(week: 2)
  end

  def lastweek
    @slots = Slot.where(week: 1)
  end

  def nextweek
    @slots = Slot.where(week: 3)
  end

  private

  def set_dayshours
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
  end
end
