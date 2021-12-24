class SlotsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 2)
  end

  def lastweek
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 1)
  end

  def nextweek
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 3)
  end

end
