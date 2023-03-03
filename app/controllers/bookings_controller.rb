class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
  end

  def index
    @my_bookings = Booking.where(user: current_user)
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new(booking_params)
    @booking.tour = @tour
    @booking.user = current_user
    @booking.date= Date.new params[:booking]["date(1i)"].to_i, params[:booking]["date(2i)"].to_i,params[:booking]["date(3i)"].to_i
    if @booking.save
      redirect_to @tour, notice: 'Booking was successfully created.'
    else
      redirect_to @tour, alert: 'Booking could not be created.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully deleted.'
    else
      redirect_to bookings_path, alert: 'Booking could not be deleted.'
    end
  end

private

  def booking_params
    params.require(:booking).permit(:tour_id, :user_id,:date)
  end
end
