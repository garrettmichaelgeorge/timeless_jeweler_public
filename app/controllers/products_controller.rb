class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
      flash.now[:success] = 'Product was successfully added to inventory'
    else
      render :new
      flash.now[:info] = 'Product was not added.'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      flash.now[:success] = "Product was successfully updated."
    else
      render :edit
      flash.now[:info] = 'Customer was not updated.'
    end
  end

  def destroy
    @product.destroy
    flash.now[:success] = 'Product was successfully deleted.'
    redirect_to products_path
  end
  
  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :brand,
      :cost,
      :price,
      :size,
      :size_unit,
      :weight,
      :weight_unit
    )
  end
end
