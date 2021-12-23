class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
    @reservation = Reservation.new

    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
  end

  def create
    raise
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :description)
  end

end
