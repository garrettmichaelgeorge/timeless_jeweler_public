class FlashComponent < ApplicationComponent
  CSS_CLASSES = {
    notice: 'success',
    success: 'success',
    error: 'danger',
    alert: 'danger'
  }

  def initialize(flash:)
    @flash = flash
  end

  def render?
    flash.present?
  end

  private

  attr_reader :flash

  def id_for(message_type) = "flash_#{message_type}"

  def css_class_for(message_type)
    class_names 'alert', alert_type(message_type), 'alert-dismissable', 'fade', 'show'
  end

  def alert_type(message_type)
    "#{alert_base}-#{alert_modifier(message_type)}"
  end

  def alert_modifier(message_type)
    CSS_CLASSES.fetch(message_type.to_sym)
  end

  def alert_base
    'alert'
  end
end
