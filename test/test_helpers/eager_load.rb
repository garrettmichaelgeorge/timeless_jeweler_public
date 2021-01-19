module EagerLoader
  def self.included(base)
    base.class_eval do
      Rails.application.config.eager_load = true

      Rails.application.configure do
        files = ['app/models/piece.rb',
                 'app/models/loose_gemstone.rb',
                 'app/models/miscellaneous_item.rb']

        files.each do |file|
          config.eager_load_paths += Dir[file]
          ActiveSupport::Reloader.to_prepare do
            Dir[file].require_dependency("#{Dir.pwd}/#{file}")
          end
        end
      end
    end
  end
end

# class ActionDispatch::IntegrationTest
#   include EagerLoader
# end
