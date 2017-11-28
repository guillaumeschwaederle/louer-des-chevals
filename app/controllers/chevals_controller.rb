class ChevalsController < ApplicationController
  def index
    @chevals = Cheval.all
  end

  def show
    @cheval = Cheval.find(params[:id])
  end

  def new
    @cheval = Cheval.new
  end

  def create
    @cheval = Cheval.new(cheval_params)
    if @cheval.save
      redirect_to cheval_path(@cheval)
    else
      render :new
    end
  end

  def edit
    @cheval = Cheval.find(params[:id])
    @cheval.save
  end

  def update
    @cheval = Cheval.find(params[:id])
    @cheval.update(cheval_params)
    redirect_to cheval_path(@cheval)
  end

  def destroy
    @cheval = Cheval.find(params[:id])
    @cheval.destroy
    redirect_to chevals_path
  end

  private

  def cheval_params
    params.require(:cheval).permit(:email)
  end
end
