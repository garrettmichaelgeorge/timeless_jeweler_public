class StoreTransactionLineItemsController < ApplicationController
  before_action :set_store_transaction_line_item, only: [:show, :edit, :update, :destroy]
  before_action :get_store_transaction

  def index
    @store_transaction_line_items = StoreTransactionLineItem.all
  end

  def show
  end

  def new
    @store_transaction_line_item = StoreTransactionLineItem.new
  end

  def edit
  end

  def create
    @store_transaction_line_item = Transaction.new(store_transaction_line_item_params)

    if @person.save
      redirect_to @person, notice: 'Line item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @store_transaction_line_item.update(store_transaction_params)
      redirect_to @store_transaction
      flash.now[:success] = 'Line item was successfully updated.'
    else
      render :edit
      flash.now[:info] = 'Line item was not updated.'
    end
  end

  def destroy
    @store_transaction_line_item.destroy
    redirect_to store_transaction_line_items_path
    flash.now[:success] = 'Line Item was successfully deleted.'
  end

  private

  def set_store_transaction_line_item
    @store_transaction_line_item = StoreTransactionLineItem.find(params[:id])
  end

  def store_transaction_line_item_params
    params.require(:store_transaction_line_item).permit(permitted_params)
  end

  def get_store_transaction
    @store_transaction = StoreTransaction.find(params[:store_transaction_id])
  end

  def permitted_params
    [
      :quantity,
      :price,
      :store_transaction_id,
      :product_id,
      store_transaction: [
        :transaction_datetime,
        :party_id,
        :category_id
      ]
    ]
  end
end
