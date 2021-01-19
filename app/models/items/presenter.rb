class Items::Presenter
  delegate_missing_to :item

  INDEX_ATTRS = %i[
    id
    name
    description
    style_name
    cost
    price
  ].freeze

  SHOW_ATTRS = %i[
    id
    name
    description
    style_name
    created_at
  ].freeze

  METAL_ATTRS = %i[
    category_name
    color_name
    purity_value
  ].freeze

  MOUNTED_GEMSTONE_ATTRS = %i[
    carat
  ].freeze

  def initialize(item)
    @item = item
  end

  def index_attrs
    INDEX_ATTRS.to_h { |attr| [attr, public_send(attr)] }
  end

  def show_attrs
    SHOW_ATTRS.to_h { |attr| [attr, public_send(attr)] }
  end

  def mounted_gemstones_attrs
    mounted_gemstones.map do |mounted_gemstone|
      MOUNTED_GEMSTONE_ATTRS.to_h { |attr| [attr, mounted_gemstone.public_send(attr)] }
    end
  end

  def metals_attrs
    metals.map do |metal|
      METAL_ATTRS.to_h { |attr| [attr, metal.public_send(attr)] }
    end
  end

  def metals
    salable.metals
  end

  private

  attr_reader :item

  def metal_presenter_for(metal)
    MetalPresenter.new(metal)
  end
end
