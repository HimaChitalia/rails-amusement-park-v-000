class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by(id: self.user_id)
    @attraction = Attraction.find_by(id: self.attraction_id)

    if @attraction.tickets > @user.tickets && @attraction.min_height > @user.height
      return "Sorry. #{ticket_issue} #{height_issue}"
    elsif @attraction.tickets > @user.tickets
      return "Sorry. #{ticket_issue}"
    elsif @attraction.min_height > @user.height
      return "Sorry. #{height_issue}"
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      "Thanks for riding the #{@attraction.name}!"
    end
  end

  def ticket_issue
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
