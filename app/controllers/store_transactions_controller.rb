class StoreTransactionsController < ApplicationController
  before_action :set_store_transaction, only: [:edit, :update, :destroy]

  def index
    case params[:type]
    when 'sale'
      @store_transactions = StoreTransaction.includes(:category).where(category: params[:type])
    when 'order'
      @store_transactions = StoreTransaction.includes(:category).where(category: params[:type])
    else
      @store_transactions = StoreTransaction.includes(:category).all
    end
  end

  def show
    # @store_transaction = StoreTransaction.includes(:line_items).find(params[:id])
    @store_transaction = StoreTransaction.find(params[:id])
    @line_items = @store_transaction.store_transaction_line_items
    # @line_item = StoreTransactionLineItem.where(store_transaction_id: params[:id])
  end

  def new
    @store_transaction = StoreTransaction.new
  end

  def edit
  end

  def create
    @store_transaction = Transaction.new(store_transaction_params)

    if @person.save
      redirect_to @person, notice: 'Transaction was successfully logged.'
    else
      render :new
    end
  end

  def update
    if @store_transaction.update(store_transaction_params)
      redirect_to @store_transaction
      flash.now[:success] = 'Transaction was successfully updated.'
    else
      render :edit
      flash.now[:info] = 'Transaction was not updated.'
    end
  end

  def destroy
    @store_transaction.destroy
    redirect_to store_transactions_path
    flash.now[:success] = 'Transaction was successfully deleted.'
  end
  
  private

  def set_store_transaction
    @store_transaction = StoreTransaction.find(params[:id])
  end

  def store_transaction_params
    params.require(:store_transaction).permit(:party_id, :transaction_datetime)
  end
  
end
