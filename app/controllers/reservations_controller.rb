class ReservationsController < ApplicationController
  before_action :set_randomnumber, only: %i[show new edit]
  before_action :set_slot, only: %i[show new edit update destroy]
  before_action :set_reservation, only: %i[edit update destroy]

  def show
    @slots = Slot.all
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @reservation = Reservation.new
    respond_to do |format|
      format.js
    end
  end

  def this_week?(reservation)
    if reservation.slot.week == 2
      redirect_to root_path
    else
      redirect_to nextweek_path
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.slot_id = params[:slot_id]
    if @reservation.save
      this_week?(@reservation)
    else
      flash.alert = "Fields can't be blank"
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @slot = Slot.find(params[:slot_id])
    @reservation.update(reservation_params)
    if @reservation.save
      redirect_to slots_path
    else
      flash.alert = "Fields can't be blank"
    end
  end

  def destroy
    respond_to do |format|
      format.html
      format.js
    end
    @reservation.destroy
  end

  private

  def set_randomnumber
    @random = rand(1...9_999_999_999)
  end

  def set_slot
    @slot = Slot.find(params[:slot_id])
    @user = current_user
  end

  def set_reservation
    @reservation = Reservation.where(slot: @slot).last
  end

  def reservation_params
    params.require(:reservation).permit(:date, :description)
  end
end
