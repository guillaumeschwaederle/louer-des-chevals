class ProfileschevalsController < ApplicationController
  def index
    if current_user
      @profile = current_user.profile
      @chevals = current_user.profile.chevals
    else
      redirect_to new_user_session_path
    end
  end
end
