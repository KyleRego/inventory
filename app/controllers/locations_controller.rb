# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy new_item new_inventory ]

  def index
    @locations = Location.all
    @unlocated_items = Item.all.where(location_id: nil)
  end

  def show
    @inventories = @location.items.where(container: true)
    @items = @location.items.where(container: false)
  end

  def new
    @location = Location.new
  end

  def new_item
    @item = Item.new
  end

  def new_inventory
    @item = Item.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    @location.picture.attach(params[:picture]) if params[:picture]

    if @location.save
      redirect_to location_url(@location), notice: "Location #{@location.id} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      redirect_to location_url(@location), notice: "Location #{@location.id} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy

    redirect_to locations_url, notice: "Location #{@location.id} was successfully destroyed."
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :description, :picture)
    end
end
