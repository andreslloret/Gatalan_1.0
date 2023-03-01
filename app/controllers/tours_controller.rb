class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tours_path
    else
      render :new
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :price, :date)
  end
end
