require 'yaml'

module NavigationHelper
  def navigation
    namespace = params[:controller].split('/').first
    nav = YAML.load_file File.join(Rails.root, 'config/navigation.yml')
    if nav.has_key?(namespace) && !nav[namespace].blank?
      nav[namespace]
    else
      []
    end
  end
end