class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @spell = Spell.find(@booking.spell_id)
  end

  def new
    @booking = Booking.new
  end

  def create
  end

  def my_bookings
  end

  def delete
  end
end
