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
    item = item_creator.build_item(item_params)
    item_creator.persist(item)
  end

  def update
    item_updater.update_item(item: item)
  end

  def destroy
    item_destroyer.destroy_item(item: item)
  end

  def create_item_succeeded(item:, msg:)
    redirect_to item,
                success: msg
  end

  def create_item_failed(item:, msg:)
    @item = item
    render :new
    flash.now[:info] = msg
  end

  def update_item_succeeded(item:, msg:)
    redirect_to item,
                success: msg
  end

  def update_item_failed(item:, msg:)
    @item = item
    render :edit
    flash.now[:info] = msg
  end

  def destroy_item_suceeded(msg:)
    redirect_to items_path,
                success: msg
  end

  def destroy_item_failed(msg:)
    redirect_to items_path,
                notice: msg
  end

  private

  def set_item
    # https://docs.stimulusreflex.com/working-with-forms#the-params-accessor
    @item ||= repo.find_item(params[:id])
  end

  def repo
    @repo ||= Items::Repo.new
  end

  def item
    @item ||= item_creator.build_item
  end

  def item_creator
    @item_creator ||= Items::Creator.new(context: self)
  end

  def item_updater
    @item_updater ||= Items::Updater.new(context: self)
  end

  def item_destroyer
    @item_destroyer ||= Items::Destroyer.new(self)
  end

  def item_params
    params.require(:item).permit(*permitted_params)
  end

  def permitted_params
    [:name,
     :description,
     :category,
     :notes,
     :item_style_id,
     :cost_cents,
     :price_cents,
     piece_attributes: permitted_piece_params,
     gemstone_attributes: permitted_gemstone_params]
  end

  def permitted_piece_params
    [mounted_gemstone_attributes: permitted_gemstone_params,
     metals_attributes: permitted_metal_params]
  end

  def permitted_gemstone_params
    %i[id
       carat
       _destroy]
  end

  def permitted_metal_params
    %i[id
       metal_category_id
       metal_color_id
       metal_purity_id
       _destroy]
  end
end
