class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.includes(:category, :style).all
  end

  def show; end

  def new
    @product = Product.new
    # FIXME: need to conditionally call build_jewelry_product,
    # build_gemstone_product, and build_miscellaneous_product
    @product.build_jewelry_product
    @product.build_gemstone_product
    @product.build_miscellaneous_product
    @styles = Product::Style.all
  end

  def edit; end

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
      flash.now[:success] = 'Product was successfully updated.'
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
    params.require(:product).permit(*permitted_params)
  end

  def permitted_params
    %i[
      name
      category
      creator
      cost
      price
      size
      size_unit
      weight
      weight_unit
    ]
  end
end
