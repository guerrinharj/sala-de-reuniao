class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all

    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    respond_to do |format|
      format.js
    end
  end

  def create
    raise
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :description)
  end

end
