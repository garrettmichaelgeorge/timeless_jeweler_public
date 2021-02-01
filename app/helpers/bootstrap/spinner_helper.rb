module Bootstrap
  module SpinnerHelper
    def spinner(**opts)
      id = opts.delete(:id)
      color = opts.delete(:color)
      animation = opts.delete(:animation)

      spinner = Spinner.new(color: color, animation: animation)

      tag.div id: id, class: spinner.css_class, role: 'status', **opts do
        tag.span 'Loading...', class: 'sr-only'
      end
    end

    private

    def css_class_for(color); end

    class Spinner
      attr_reader :color, :animation

      def initialize(color: 'default', animation: 'border')
        @color = color
        @animation = animation
      end

      def css_class
        class_names("spinner-#{animation}", Bootstrap.text_color(color))
      end
    end
  end
end
