class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def tours_params
    params.require(:article).permit(:title, :body, :photo)
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

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tours_path
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
    params.require(:tour).permit(:name, :description, :date, :price, :photo)
  end
end
