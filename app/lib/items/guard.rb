class Items::Guard
  def initialize(context:)
    @context = context
  end

  def protect
    params.require(:item)
          .permit(:name,
                  :description,
                  :item_style_id,
                  :cost_cents,
                  :price_cents,
                  :notes,
                  :category,
                  piece_attributes: [
                    { metals_attributes: metals_attributes },
                    { mounted_gemstones_attributes: gemstone_attributes }
                  ],
                  gemstone_attributes: gemstone_attributes)
  end

  private

  attr_reader :context

  def params
    context.params
  end

  def gemstone_attributes
    %i[id
       carat
       _destroy]
  end

  def metals_attributes
    %i[id
       metal_category_id
       metal_color_id
       metal_purity_id
       _destroy]
  end
end
