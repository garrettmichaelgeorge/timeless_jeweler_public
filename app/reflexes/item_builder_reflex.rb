# frozen_string_literal: true

class ItemBuilderReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  delegate :current_user, to: :connection

  before_reflex do
    @builder ||= ItemBuilder.new
    @builder.assign_attributes(intake_params)
  end

  def submit
    @builder.save
  end

  def set_salable; end

  def add_metal
    @builder.add_metal
  end

  def add_metals
    @builder.add_metals
  end

  def add_gemstone
    @builder.add_gemstone
  end

  def add_gemstones
    @builder.add_gemstones
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
