class ProfileschevalsController < ApplicationController
  def index
    @profile = current_user.profile
    @chevals = current_user.profile.chevals
  end
end
