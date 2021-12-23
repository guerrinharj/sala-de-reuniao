class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
  end
end
