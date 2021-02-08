class PageHeaderComponent < ApplicationComponent
  def initialize(title:, pre_title:, wrapper_class: '', buttons: [], tabs: [])
    @title = title
    @pre_title = pre_title
    @buttons = buttons
    @tabs = tabs
  end

  private

  attr_reader :wrapper_class, :title, :pre_title, :buttons, :tabs

  def buttons_and_tabs?
    buttons.present? && tabs.present?
  end
end
