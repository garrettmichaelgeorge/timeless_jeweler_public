module STIPreload
  # Include this in every STI root class

  # https://guides.rubyonrails.org/autoloading_and_reloading_constants.html#single-table-inheritance

  # Single Table Inheritance is a feature that doesn't play well with lazy loading.
  # Reason is, its API generally needs to be able to enumerate the STI hierarchy to
  # work correctly, whereas lazy loading defers loading classes until they are
  # referenced. You can't enumerate what you haven't referenced yet.

  # In a sense, applications need to eager load STI hierarchies regardless of the
  # loading mode.

  # Of course, if the application eager loads on boot, that is already accomplished.
  # When it does not, it is in practice enough to instantiate the existing types in
  # the database, which in development or test modes is usually fine. One way to do
  # that is to throw this module into the lib directory:

  unless Rails.application.config.eager_load
    extend ActiveSupport::Concern

    included do
      cattr_accessor :preloaded, instance_accessor: false
    end

    class_methods do
      def descendants
        preload_sti unless preloaded
        super
      end

      # Constantizes all types present in the database. There might be more on
      # disk, but that does not matter in practice as far as the STI API is
      # concerned.
      #
      # Assumes store_full_sti_class is true, the default.
      def preload_sti
        types_in_db = \
          base_class
          .unscoped
          .select(inheritance_column)
          .distinct
          .pluck(inheritance_column)
          .compact

        types_in_db.each do |type|
          logger.debug("Preloading STI type #{type}")
          type.constantize
        end

        self.preloaded = true
      end
    end
  end
end
