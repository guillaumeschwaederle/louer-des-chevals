class ChevalsController < ApplicationController
  before_action :set_cheval, only: [:show, :edit, :update, :destroy]

  def index
    @chevals = Cheval.all
  end

  def show
  end

  def new
    @cheval = Cheval.new
  end

  def create
    @cheval = Cheval.new(cheval_params)

  end

  def edit
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
    params.require(:cheval).permit(:name, :description, :address, :taille, :price, :pattes, :robe_id, :category_id)
  end
end
