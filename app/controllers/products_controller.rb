class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.includes(:style).all
  end

  def show; end

  def new
    @product = Product.new
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
    [
      :name,
      :description,
      :notes,
      :product_style_id,
      :category,
      :cost_cents,
      :price_cents,
      jewelry_product_attributes: permitted_jewelry_product_params,
      gemstone_product_attributes: permitted_gemstone_params
    ]
  end

  def permitted_jewelry_product_params
    [
      mounted_gemstone_attributes: permitted_gemstone_params,
      metal_attributes: permitted_metal_params
    ]
  end

  def permitted_gemstone_params
    []
  end

  def permitted_metal_params
    %i[
      id
      metal_category_id
      metal_color_id
      metal_purity_id
    ]
  end
end
