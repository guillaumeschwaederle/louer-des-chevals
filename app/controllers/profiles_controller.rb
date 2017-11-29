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
  end

  def update
    @profile = Profile.find(current_user.profile.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def profile_params
  params.require(:profile).permit(:first_name, :last_name, :phone_number, :user_id)
  end
end
