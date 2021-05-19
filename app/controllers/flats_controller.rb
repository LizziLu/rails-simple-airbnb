class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      rerdirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroys
    @flat.destroy
    redirect_to flats_url, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
