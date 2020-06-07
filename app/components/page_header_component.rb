class PageHeaderComponent < ApplicationComponent
  attr_accessor :wrapper_class, :title, :pre_title, :buttons, :tabs

  def initialize(wrapper_class: "", title:, pre_title:, buttons: [], tabs: [])
    
    # Set default values for variables if not passed to component
    # @action_button_options = action_button_options.blank? ? {} : action_button_options
    # @wrapper_class = wrapper_class.blank? ? "" : wrapper_class

    wrapper_class ||= ""
    buttons ||= []
    tabs ||= {}

    @wrapper_class = wrapper_class
    @title = title
    @pre_title = pre_title
    @buttons = buttons
    @tabs = tabs

    # Add Bootstrap style class to button[:options]
    # @action_button_options.store(:class, 'btn btn-primary lift')
  end

end
