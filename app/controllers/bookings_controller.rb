class BookingsController < ApplicationController

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to my_bookings_path, notice: "Your booking is created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_bookings
    @bookings = Booking.all
  end

  def delete
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :spell_id)
  end
end
