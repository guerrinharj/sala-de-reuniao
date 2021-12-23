class ReservationsController < ApplicationController
  def new
    @slot = Slot.find(params[:slot_id])
    @user = current_user
    @reservation = Reservation.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.slot_id = params[:slot_id]
    if @reservation.save
      redirect_to slots_path
    else
      flash.alert = "Fields can't be blank"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
     respond_to do |format|
      format.html
      format.js
    end
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :description)
  end

end
