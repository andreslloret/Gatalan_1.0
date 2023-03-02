class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save
      redirect_to tours_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create_booking
    @tour = Tour.find(params[:id])
    @booking = @tour.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to tour_path(@tour), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])

    if @tour.update(tour_params)
      redirect_to tours_path
    else
      render :edit
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :date, :price, :image)
  end
  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end
end
