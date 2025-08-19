class PerfumesController < ApplicationController
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
