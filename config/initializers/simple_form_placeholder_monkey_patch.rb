module SimpleForm
  module Components
    module Placeholders
      # Monkey-pach Simple Form to automatically generate placeholders (using similar
      # logic to those of labels)
      # This avoids having to hard-code placeholders for every single input field in
      # simple_form.en.yml

      # References:
      # SimpleForm placeholders implementation (standard)
      # https://github.com/heartcombo/simple_form/blob/cbcfe2e972fc25a53474d72b256a7f6c389de545/lib/simple_form/components/placeholders.rb#L11
      # SimpleForm auto-generated labels implementation
      # https://github.com/heartcombo/simple_form/blob/cbcfe2e972fc25a53474d72b256a7f6c389de545/lib/simple_form/components/labels.rb#L73

      # def placeholder_text(_wrapper_options = nil)
      #   placeholder = options[:placeholder]

      #   # Placeholder generation algorithm
      #   # 1. Use provided placeholder provided it is a string
      #   #    => OPTIMIZE: is this type check really necessary?
      #   # 2. Look up translation in I18n
      #   # 3. Generate placeholder by humanizing the attribute name specific to the form object
      #   # 4. Generate placeholder by humanizing the attribute name generically

      #   if placeholder.is_a?(String)
      #     placeholder
      #   elsif translate_from_namespace(:placeholders)
      #     translate_from_namespace(:placeholders)
      #   elsif object.class.respond_to?(:human_attribute_name)
      #     object.class.human_attribute_name(reflection_or_attribute_name.to_s)
      #   else
      #     attribute_name.to_s.humanize
      #   end
      # end
    end
  end
end
