class ProfilesbookingsController < ApplicationController
  def index
    @bookings = current_user.profile.bookings
  end
end
