Items::Guard = Struct.new(:context) do
  def protect
    params.require(:item).permit(*permitted_params)
  end

  def params
    context.params
  end

  def permitted_params
    [:name,
     :description,
     :category,
     :notes,
     :item_style_id,
     :cost_cents,
     :price_cents,
     piece_attributes: permitted_piece_params,
     gemstone_attributes: permitted_gemstone_params]
  end

  def permitted_piece_params
    [mounted_gemstone_attributes: permitted_gemstone_params,
     metals_attributes: permitted_metal_params]
  end

  def permitted_gemstone_params
    %i[id
       carat
       _destroy]
  end

  def permitted_metal_params
    %i[id
       metal_category_id
       metal_color_id
       metal_purity_id
       _destroy]
  end
end
