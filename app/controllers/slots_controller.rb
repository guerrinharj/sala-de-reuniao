class SlotsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.all
  end

end
