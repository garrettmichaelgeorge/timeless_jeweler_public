class SalesController < ApplicationController
  before_action :set_sale, only: %i[edit update destroy]

  def index
    @sales = Sale.includes(:party, :line_items)
  end

  def show
    # @sale = Sale.includes(:line_items).find(params[:id])
    @sale = Sale.find(params[:id])
    @line_items = @sale.line_items
    # @line_item = Sale::LineItem.where(sale_id: params[:id])
  end

  def new
    @sale = Sale.new
    @line_item = @sale.line_items.build
    @item = @line_item.build_item
  end

  def edit; end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to @sale, success: t('success')
    else
      render :new
      flash.now[:info] = t('failure')
    end
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, success: t('success')
    else
      render :edit
      flash.now[:info] = t('failure')
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_path, success: t('success')
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:party_id, :transaction_datetime,
                                 line_items_attributes: %i[id item_id quantity])
  end
end
