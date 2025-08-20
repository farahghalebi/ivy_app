# app/controllers/perfumes_controller.rb
class PerfumesController < ApplicationController
  def index
    @perfumes = Perfume.all
  end

  def new
    @perfume = Perfume.new(category: params[:category]) # preselect if provided
  end

  def create
    @perfume = Perfume.new(perfume_params)
    if @perfume.save
      redirect_to @perfume, notice: "Perfume created successfully"
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
