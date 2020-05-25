class PageHeaderComponent < ApplicationComponent
  def initialize(title:, pre_title:, action_button_text:, action_button_link:, action_button_options:, tabs:)

    @title = title
    @pre_title = pre_title
    @action_button_text = action_button_text
    @action_button_link = action_button_link

    # Set default values for variables if not passed to component
    @tabs = defined?(tabs) ? tabs : {}
    @action_button_options = action_button_options.blank? ? {} : action_button_options

    # Add Bootstrap style class to action_button
    @action_button_options.store(:class, 'btn btn-primary lift')
  end
end
