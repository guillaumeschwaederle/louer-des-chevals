class ProfilesReservationsClientsController < ApplicationController
  def index
    if current_user
      @profile = current_user.profile
      @chevals = @profile.chevals
    end
  end
end
