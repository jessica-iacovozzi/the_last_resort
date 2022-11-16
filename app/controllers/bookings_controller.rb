class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @spell = Spell.find(@booking.spell_id)
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
    @bookings = Booking.where(user_id: current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :spell_id)
  end
end
