# app/controllers/perfumes_controller.rb
class PerfumesController < ApplicationController
  #a global authenticate_user!, this makes index/show public
  skip_before_action :authenticate_user!, only: [:index, :show], raise: false
  # Require auth for the rest
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_perfume, only: [:show, :destroy]

  def index
    @category = params[:category].presence
    @perfumes =
      if @category.present?
        Perfume.where(category: @category)
      else
        Perfume.all
      end
  end

  def new
    @perfume = Perfume.new(category: preselected_category)
  end

  def create
    @perfume = Perfume.new(perfume_params)
    if @perfume.save
      redirect_to perfume_path(@perfume), notice: "Perfume created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @perfume.destroy
    redirect_to perfumes_path, notice: "Perfume removed."
  end

  private

  def set_perfume
    @perfume = Perfume.find(params[:id])
  end

  def perfume_params
    params.require(:perfume).permit(:name, :category, :description, :url)
  end

  def preselected_category
    # Use the URL param if present; otherwise default nicely
    params[:category].presence || "Eau de Parfum"
  end
end
