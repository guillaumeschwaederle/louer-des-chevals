class BookingsController < ApplicationController

  before_action :set_cheval, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :validate, :refuse, :cancel]

  def show
    unless current_user.profile == @booking.profile || current_user.profile == @booking.cheval.profile
      redirect_to chevals_path
    end
  end

  def create
    if current_user
      @booking = Booking.new(booking_params)
      @booking.profile = current_user.profile
      @booking.cheval = @cheval
      @booking.save
      if @booking.save
        redirect_to cheval_path(params[:cheval_id])
      else
        render :new
      end
    else
      flash[:notice] = "Vous n'êtes pas connecté"
      redirect_to new_user_session_path
    end
  end

  def edit
    unless current_user.profile == @booking.profile
      redirect_to cheval_booking_path(@booking)
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to cheval_booking_path(@cheval, @booking)
  end

  def destroy
    @booking.destroy
    redirect_to profile_mesclients_path(current_user.profile)
  end

  def validate
    @booking.statut = "Validé"
    if @booking.save
      redirect_to profile_mesclients_path(current_user.profile)
    else
      render :new
    end
  end

  def refuse
    @booking.statut = "Refusé"
    if @booking.save
      redirect_to profile_mesclients_path(current_user.profile)
    else
      render :new
    end
  end

  def cancel
    @booking.statut = "Annulé"
    if @booking.save
      redirect_to cheval_booking_path(@booking.cheval, @booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_cheval
    @cheval = Cheval.find(params[:cheval_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :statut, :message, :cheval_id, :profile_id)
  end
end
