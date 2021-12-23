class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
    @slot
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      flash.alert = "Fields can't be blank"
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :description)
  end

end
