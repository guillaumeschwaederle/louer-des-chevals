class BookingsController < ApplicationController
  before_action :set_cheval, only: [:new, :create, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.profile = current_user.profile
    @booking.cheval = @cheval
    @booking.save
    if @booking.save
      redirect_to cheval_path(params[:cheval_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to cheval_booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to @booking.cheval
  end

  private

  def set_cheval
    @cheval = Cheval.find(params[:cheval_id])
  end

  def set_booking
    @booking = Booking.find(params[:cheval_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :statut, :message, :cheval_id, :profile_id)
  end
end
