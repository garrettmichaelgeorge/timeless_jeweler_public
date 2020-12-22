class IntakeController < ApplicationController
  def new
    @builder ||= ItemBuilder.new
  end

  def create
    @builder ||= ItemBuilder.new(intake_params)

    if @builder.save
      redirect_to items_path, notice: 'Intake was successful'
    else
      render :new
    end
  end

  private

  def intake_params
    params.require(:builder).permit(*permitted_params)
  end

  def permitted_params
    [:name,
     :description,
     :notes,
     :item_style_id,
     :cost_cents,
     :price_cents,
     :salable_id,
     :salable_type,
     piece_attributes: permitted_piece_params,
     gemstone_attributes: permitted_gemstone_params]
  end

  def permitted_piece_params
    [mounting_attributes: permitted_gemstone_params,
     metal_attributes: permitted_metal_params]
  end

  def permitted_gemstone_params
    [:carat]
  end

  def permitted_metal_params
    %i[id
       metal_category_id
       metal_color_id
       metal_purity_id]
  end
end
