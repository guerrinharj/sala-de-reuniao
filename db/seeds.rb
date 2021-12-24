# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Slot.destroy_all

def seed_slots(week)
  days = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
  hours = (6..23).to_a
  days.each do |day|
    hours.each do |hour|
      slot = Slot.new
      slot.week = week
      slot.day = day
      slot.hour = "#{hour}:00"
      slot.save!
    end
  end
end

seed_slots(1)
seed_slots(2)
seed_slots(3)

Reservation.destroy_all

20.times do
  @reservation = Reservation.new
  @reservation.user = User.all.order('RANDOM()').first
  @reservation.slot = Slot.where(week: 1).order('RANDOM()').first
  @reservation.description = "Reunião com #{Faker::IndustrySegments.sub_sector}"
  @reservation.save!
end
