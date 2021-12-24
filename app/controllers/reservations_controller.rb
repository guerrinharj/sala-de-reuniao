class ReservationsController < ApplicationController
  def show
    @random = rand(1...9_999_999_999)
    @slots = Slot.all
    @slot = Slot.find(params[:slot_id])
    @user = current_user
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @random = rand(1...9_999_999_999)
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
      if @reservation.slot.week == 2
        redirect_to root_path
      else
        redirect_to nextweek_path
      end
    else
      flash.alert = "Fields can't be blank"
    end
  end

  def edit
    @random = rand(1...9_999_999_999)
    @slot = Slot.find(params[:slot_id])
    @reservation = Reservation.where(slot: @slot).last
    respond_to do |format|
      format.js
    end
  end

  def update
    @slot = Slot.find(params[:slot_id])
    @reservation = Reservation.where(slot: @slot).last
    @reservation.update(reservation_params)
    if @reservation.save
      redirect_to slots_path
    else
      flash.alert = "Fields can't be blank"
    end
  end

  def destroy
    @slot = Slot.find(params[:slot_id])
    @reservation = Reservation.where(slot: @slot).last
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
