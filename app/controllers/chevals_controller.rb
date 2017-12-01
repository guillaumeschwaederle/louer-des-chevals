class ChevalsController < ApplicationController
  before_action :set_cheval, only: [:show, :edit, :update, :destroy]

  def index
    @chevals = Cheval.all
    @chevals = Cheval.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@chevals) do |cheval, marker|
      marker.lat cheval.latitude
      marker.lng cheval.longitude
      marker.infowindow ("
        <div class = 'cheval-window'>
           <p> Ici se trouve <strong>#{cheval.name}</strong></p>
           <a href='#{cheval_path(cheval)}'><img src='#{cheval.photo_url}' style='width:140px;height:100px;'></a>
        </div>
        ")
    end
  end

  def show
    @cheval_coordinates = { lat: @cheval.latitude, lng: @cheval.longitude }
    @booking = Booking.new
  end

  def new
    if current_user
      @cheval = Cheval.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @cheval = Cheval.new(cheval_params)
    @cheval.profile = current_user.profile
    @cheval.save
    if @cheval.save
      redirect_to cheval_path(@cheval)
    else
      render :new
    end
  end

  def edit
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def update
    @cheval.update(cheval_params)
    if @cheval.update(cheval_params)
      redirect_to cheval_path(@cheval)
    else
      render :new
    end
  end

  def destroy
    @cheval.destroy
    redirect_to chevals_path
  end

  private

  def set_cheval
    @cheval = Cheval.find(params[:id])
  end

  def cheval_params
    params.require(:cheval).permit(:name, :description, :address, :taille, :price, :pattes, :ville, :rue, :robe_id, :category_id, :photo, :photo_cache)
  end
end
