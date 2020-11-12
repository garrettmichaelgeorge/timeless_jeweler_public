module FormHelper
  def setup_product(product)
    product.jewelry_product       ||= Product::JewelryProduct.new
    product.gemstone_product      ||= Product::GemstoneProduct.new
    product.miscellaneous_product ||= Product::MiscellaneousProduct.new

    product
  end
end
