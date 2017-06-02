class AttractionsController < ApplicationController

  before_action :set_attraction, only: [:show, :edit, :update]

  def greeting
  end

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      redirect_to attractions_path, alert: "Something went wrong, Please try again!"
    end
  end

  def show
    @ride = Ride.new
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, alert: "You have successfully updated #{@attraction.name}"
    else
      redirect_to attractions_path, alert: "Couldn't update #{@attraction.name}. Please try again."
    end
  end

  private

  def attraction_params
    params.required(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
