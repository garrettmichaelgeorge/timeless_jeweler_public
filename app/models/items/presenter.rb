class Items::Presenter
  attr_reader :item

  delegate_missing_to :item

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
end
