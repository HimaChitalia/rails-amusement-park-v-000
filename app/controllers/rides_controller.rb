class RidesController < ApplicationController

  def create
    ride = Ride.new(ride_params)
    if ride.save
      alert = ride.take_ride
      redirect_to user_path(ride.user), alert: alert
    else
      redirect_to root_path, alert: "Something went wrong! Please try again after some time."
    end
  end


  private

    def ride_params
      params.required(:ride).permit(:attraction_id, :user_id)
    end
end
