class ProfilesbookingsController < ApplicationController
  def index
    if current_user
      @bookings = current_user.profile.bookings
    else
      redirect_to new_user_session_path
    end
  end
end
