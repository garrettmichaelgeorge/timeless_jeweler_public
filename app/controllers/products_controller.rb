class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.includes(:style).all
  end

  def show; end

  def new
    @product = Product.new
    # FIXME: need to conditionally call build_jewelry_product,
    # build_gemstone_product, and build_miscellaneous_product
    @product.build_jewelry_product
    @product.build_gemstone_product
    @product.build_miscellaneous_product
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
      permitted_jewelry_product_params,
      permitted_gemstone_product_params
    ]
  end

  def permitted_jewelry_product_params
    {
      jewelry_product_attributes: [
        metal_ids: [],
        metal_purity_ids: [],
        metal_color_ids: [],
        gemstone_ids: []
      ]
    }
  end

  def permitted_gemstone_product_params
    {
      gemstone_product_attributes: []
    }
  end
end
