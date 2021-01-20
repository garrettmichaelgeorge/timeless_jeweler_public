class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  # RESTful methods
  def index
    @items = repo.find_all_items
  end

  def show
    item_record = repo.find_item(params[:id])
    @item ||= item_presenter_for(item_record)
  end

  def new
    @item = item_creator.item
  end

  def edit; end

  def create
    creator = Items::Creator.new(context: self, attrs: item_params)
    creator.create!
  end

  def update
    item_updater.update_item(item: item)
  end

  def destroy
    item_destroyer.destroy_item(item: item)
  end

  # Callback methods
  def create_item_succeeded(item:, msg:)
    redirect_to item, success: msg
  end

  def create_item_failed(item:, msg:)
    @item = item
    render :new
    flash.now[:info] = msg
  end

  def update_item_succeeded(item:, msg:)
    redirect_to item, success: msg
  end

  def update_item_failed(item:, msg:)
    @item = item
    render :edit
    flash.now[:info] = msg
  end

  def destroy_item_suceeded(msg:)
    redirect_to items_path, success: msg
  end

  def destroy_item_failed(msg:)
    redirect_to items_path, notice: msg
  end

  private

  def set_item
    # https://docs.stimulusreflex.com/working-with-forms#the-params-accessor
    @item ||= repo.find_item(params[:id])
  end

  def repo
    @repo ||= Items::Repo.new(context: self)
  end

  def item
    @item ||= item_creator.item
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

  def item_presenter_for(item)
    Items::Presenter.new(item)
  end

  def item_params
    Items::Guard.new(context: self).protect
  end
end
