# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit edit_inventory inventory_items update destroy ]

  def show
    @location = @item.location
    @items = @item.items
  end

  def new
    @item = Item.new
    @locations = Location.all
  end

  def edit
    @location = @item.location
    @locations = Location.all
  end

  def edit_inventory
    redirect_to item_path(@item) unless @item.container

    @location = @item.location

    if @location
      @items = @location.items
    else
      @items = Item.all
    end

    @selected_items_ids = @item.items.pluck(:id).to_a
  end

  def inventory_items
    redirect_to item_path(@item) unless @item.container

    selected_items = Item.where(id: params[:item][:item_ids])
    @item.items = selected_items

    redirect_to item_path(@item)
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
    was_inventory = @item.container

    if @item.update(item_params)
      if was_inventory && (@item.container == false)
        @item.items.update(item_id: nil)
        redirect_to item_url(@item), notice: "Item was successfully updated. Any contained items were removed."
      else
        redirect_to item_url(@item), notice: "Item was successfully updated."
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    redirect_to locations_url, notice: "Item was successfully deleted."
  end

  private
    def set_item
      @item = Item.includes(:location, :item).find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :notes, :item_id, :container, :location_id, :picture)
    end
end
