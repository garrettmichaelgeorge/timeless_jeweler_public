class Items::Guard
  def initialize(context:)
    @context = context
  end

  def protect
    params.require(:item)
          .permit(:name,
                  :description,
                  :item_style_id,
                  :cost,
                  :price,
                  :notes,
                  :category,
                  profile_attributes: {
                    metals_attributes: metals_attributes,
                    metals: metals_attributes,
                    gemstone_attributes: gemstone_attributes,
                    gemstones: gemstone_attributes
                  })
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
