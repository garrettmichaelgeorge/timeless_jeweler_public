class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.includes(:style).all
  end

  def show; end

  def new
    @item ||= Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
      flash.now[:success] = 'Item was successfully added to inventory'
    else
      render :new
      flash.now[:info] = 'Item was not added.'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
      flash.now[:success] = 'Item was successfully updated.'
    else
      render :edit
      flash.now[:info] = 'Customer was not updated.'
    end
  end

  def destroy
    @item.destroy
    flash.now[:success] = 'Item was successfully deleted.'
    redirect_to items_path
  end

  private

  def set_item
    # https://docs.stimulusreflex.com/working-with-forms#the-params-accessor
    @item ||= Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(*permitted_params)
  end

  def permitted_params
    [
      :name,
      :description,
      :notes,
      :item_style_id,
      :category,
      :cost_cents,
      :price_cents,
      piece_attributes: permitted_piece_params,
      gemstone_attributes: permitted_gemstone_params
    ]
  end

  def permitted_piece_params
    [
      mounted_gemstone_attributes: permitted_gemstone_params,
      metal_attributes: permitted_metal_params
    ]
  end

  def permitted_gemstone_params
    [
      :carat
    ]
  end

  def permitted_metal_params
    %i[
      id
      metal_category_id
      metal_color_id
      metal_purity_id
    ]
  end
end
