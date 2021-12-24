class SlotsController < ApplicationController
  def index
    skip_policy_scope
    skip_authorization
    @user = current_user
    @reservations = Reservation.all
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 2)
  end

  def lastweek
    skip_policy_scope
    skip_authorization
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 1)
  end

  def nextweek
    skip_policy_scope
    skip_authorization
    @days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    @hours = (6..23).to_a
    @slots = Slot.where(week: 3)
  end
end
