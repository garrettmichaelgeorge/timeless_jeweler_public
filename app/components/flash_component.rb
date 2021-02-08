class FlashComponent < ApplicationComponent
  CSS_CLASSES = { notice: 'success',
                  success: 'success',
                  error: 'danger',
                  alert: 'danger' }.freeze

  delegate :close_button,
           to: :helpers

  def initialize(flash:)
    @flash = flash

    super
  end

  def render?
    flash.present?
  end

  private

  attr_reader :flash

  def id_for(message_type) = "flash_#{message_type}"

  def css_classes_for(message_type)
    class_names('alert',
                alert_css_class(message_type),
                'alert-dismissible',
                'fade',
                'show')
  end

  def alert_css_class(message_type)
    "#{alert_base_class}-#{alert_modifier_class(message_type)}"
  end

  def alert_base_class
    'alert'
  end

  def alert_modifier_class(message_type)
    CSS_CLASSES.fetch(message_type.to_sym) { '' }
  end
end
