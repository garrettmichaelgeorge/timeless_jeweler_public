class FlashComponent < ApplicationComponent
  def initialize(flash:)
    @flash = flash
  end

  def render?
    flash.present?
  end

  private

  attr_reader :flash

  def id_for(message_type)
    "flash_#{message_type}"
  end

  def css_class_for(message_type)
    case message_type.to_sym
    when :notice then 'alert alert-success alert-dismissable fade show'
    when :success then 'alert alert-success alert-dismissable fade show'
    when :error then 'alert alert-danger alert-dismissable fade show'
    when :alert then 'alert alert-danger alert-dismissable fade show'
    end
  end

  def icon_for(message_type)
    case message_type.to_sym
    when :notice then 'fe fe-alert-circle'
    when :success then 'fe fe-check-square'
    when :error then 'fe fe-alert-triangle'
    when :alert then 'fe fe-alert-octagon'
    end
  end
end
