class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new(tour: @tour, user: current_user)
    if @booking.save
      redirect_to @tour, notice: 'Booking was successfully created.'
    else
      redirect_to @tour, alert: 'Booking could not be created.'
    end
  end
end
