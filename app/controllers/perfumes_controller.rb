class PerfumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] # remove later, needed for show page

  def index
    @perfumes = Perfume.all
  end

  def new
    @perfume = Perfume.new
  end

  def create
    @perfume = Perfume.new(perfume_params)
    if @perfume.save
      redirect_to @perfume, notice: "Perfume created successfuly"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @perfume = Perfume.find(params[:id])
  end

  private

  def perfume_params
    params.require(:perfume).permit(:name, :category, :description, :url)
  end
end
