class SalesController < ApplicationController
  before_action :set_sale, only: %i[edit update destroy]

  def index
    @sales = case params[:type]
             when 'sale'
               Sale.includes(:category, :party,
                             :sale_line_items).where(category: params[:type])
             when 'order'
               Sale.includes(:category).where(category: params[:type])
             else
               Sale.includes(:category, :party).all
             end
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
    @product = @line_item.build_product
  end

  def edit; end

  def create
    @sale = Sale.new(sale_params)

    if @person.save
      redirect_to @person, notice: 'Transaction was successfully logged.'
    else
      render :new
    end
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale
      flash.now[:success] = 'Transaction was successfully updated.'
    else
      render :edit
      flash.now[:info] = 'Transaction was not updated.'
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_path
    flash.now[:success] = 'Transaction was successfully deleted.'
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:party_id, :transaction_datetime,
                                 sale_line_items_attributes: %i[id product_id quantity])
  end
end
