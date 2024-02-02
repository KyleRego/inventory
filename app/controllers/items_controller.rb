# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  def show
    @location = @item.location
    @container_item = @item.item
  end

  def new
    @item = Item.new
    @locations = Location.all
  end

  def edit
    @container_items = Item.where(container: true)
    @location = @item.location
    @locations = Location.all
  end

  def create
    @item = Item.new(item_params)

    @item.picture.attach(params[:picture]) if params[:picture]

    if @item.save
      redirect_to item_url(@item), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    redirect_to locations_url, notice: "Item was successfully destroyed."
  end

  private
    def set_item
      @item = Item.includes(:location, :item).find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :notes, :item_id, :container, :location_id, :picture)
    end
end
