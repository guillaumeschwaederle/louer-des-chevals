class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
  params.require(:profile).permit(:first_name, :last_name, :phone_number, :user_id, :photo, :photo_cache)
  end
end
