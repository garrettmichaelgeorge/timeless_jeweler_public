class STIInheritable
  extend ActiveSupport::Concern

  included do
    define_type_setter
  end

  class_methods do
    def define_type_setter
      define_method "#{inheritance_column}=" do
        unless new_record? || value == inheritance_column
          raise StandardError,
                "Cannot change #{inheritance_column} of a persisted #{model_name}! " \
                    "Need to create a new #{model_name} instead."
        end
        super
      end
    end
  end
end
