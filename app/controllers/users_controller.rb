class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end

  def destroy_reservation
    raise
  end
end
