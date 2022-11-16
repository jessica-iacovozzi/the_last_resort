class BookingsController < ApplicationController

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
  end
end
