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
    @item = new_item
  end

  def edit; end

  def create
    creator = Items::Creator.new(context: self, attrs: item_params)
    creator.create!
  end

  def update
    Items::Updater.new(context: self, item: item, attrs: item_params)
                  .update
  end

  def destroy
    item_destroyer.destroy_item(context: self, item: item)
  end

  # Callback methods
  def create_item_succeeded(item:)
    redirect_to item, success: t('success')
  end

  def create_item_failed(item:, attrs_to_validate: item_params)
    @item = item
    render :new
    # broadcast_errors @item, attrs_to_validate
    flash.now[:info] = t('failure')
  end

  def update_item_succeeded(item:, msg: '')
    redirect_to item, success: t('success')
  end

  def update_item_failed(item:, msg: '')
    @item = item
    render :edit
    flash.now[:info] = t('failure')
  end

  def destroy_item_suceeded(msg: '')
    redirect_to items_path, success: t('success')
  end

  def destroy_item_failed(msg: '')
    redirect_back fallback_location: items_path,
                  notice: t('failure')
  end

  private

  def item_presenter_for(item) = Items::Presenter.new(item)

  def item_params = item_guard.protect

  def new_item = item_creator.item

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

  def item_guard
    @item_guard ||= Items::Guard.new(context: self)
  end
end
