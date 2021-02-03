module CustomInputs
  class ExampleInput < SimpleForm::Inputs::Base
    # Example of a currency input
    # Read more: https://github.com/heartcombo/simple_form#custom-inputs

    # Usage (in views):
    # f.input :price, as: :example

    def input(wrapper_options)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      "$ #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
    end
  end
end
