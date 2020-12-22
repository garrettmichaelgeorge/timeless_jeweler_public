class ItemRepo
  def find_all_items
    Item.includes(:style).all
  end

  def find_item(id)
    Item.find(id)
  end
end

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = repo.find_all_items
  end

  def show; end

  def new
    @item ||= item
  end

  def edit; end

  def create
    creator = Items::Creator.new(context: self)
    item = creator.build_item(item_params)
    creator.persist(item)
  end

  def update
    Items::Updater.execute(context: self, item: @item)
  end

  def destroy
    @item.destroy
    msg = 'Item was successfully deleted.'
    redirect_to items_path,
                success: msg
  end

  def create_item_succeeded(item, msg)

    redirect_to item,
                success: msg
  end

  def create_item_failed(item, msg)
    @item = item
    render :new
    flash.now[:info] = msg
  end

  def update_item_succeeded(item, msg)
    redirect_to item,
                success: msg
  end

  def update_item_failed(item, msg)
    @item = item
    render :edit
    flash.now[:info] = msg
  end

  def repo
    @repo ||= ItemRepo.new
  end

  private

  def set_item
    # https://docs.stimulusreflex.com/working-with-forms#the-params-accessor
    @item ||= repo.find_item(params[:id])
  end

  def item
    @item ||= Item.new
  end

  def builder
    @builder ||= ItemBuilder.new(item_params)
  end

  def item_params
    params
      .require(:item)
      .permit(*permitted_params)
  end

  def permitted_params
    [:name,
     :description,
     :notes,
     :item_style_id,
     :category,
     :cost_cents,
     :price_cents,
     piece_attributes: permitted_piece_params,
     gemstone_attributes: permitted_gemstone_params]
  end

  def permitted_piece_params
    [mounted_gemstone_attributes: permitted_gemstone_params,
     metal_attributes: permitted_metal_params]
  end

  def permitted_gemstone_params
    [:carat]
  end

  def permitted_metal_params
    %i[id
       metal_category_id
       metal_color_id
       metal_purity_id]
  end
end
