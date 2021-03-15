class StreamSKUJob < ApplicationJob
  queue_as :default

  def perform(item:)
    cable_ready["SKU"]
      .inner_html(selector: "#sku",
                  html: render_sku(item: item),
                  children_only: true)
    cable_ready.broadcast
  end

  def render_sku(item:, component_class: Intake::SKUComponent)
    render component_class.new(item: item) 
  end
end
