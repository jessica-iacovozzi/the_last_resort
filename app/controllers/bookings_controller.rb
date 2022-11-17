class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @spell = Spell.find(@booking.spell_id)
  end

  def new
    @booking = Booking.new
    @spell = Spell.find(params[:spell_id])
  end

  def requested_spells
    #  = Booking.where(current_user)
    @bookings = current_user.spell_bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @spell = Spell.find(params[:spell_id])
    @booking.user = current_user
    @booking.spell_id = params[:spell_id]
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
    @booking.destroy
    redirect_to booking_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :spell_id)
  end
end
