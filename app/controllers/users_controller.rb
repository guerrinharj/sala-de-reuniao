class UsersController < ApplicationController
  def show
    @user = current_user
    @reservations = @user.reservations
  end
end
