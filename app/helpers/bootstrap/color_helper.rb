module Bootstrap
  module ColorHelper
    COLORS = %i[
      primary
      secondary
      success
      danger
      warning
      info
    ]

    def colors
      COLORS
    end

    def text_colors
      # Returns hash with each color mapped to its text version
      # e.g. {primary: 'text-primary', secondary: 'text-secondary'}
      COLORS.to_h do |color|
        prefix = 'text'

        css_class = []
        css_class << prefix
        css_class << color.to_s

        [color, css_class.join('-')]
      end
    end

    def text_color(context = 'default', **opts)
      text_colors(**opts)[context.to_sym]
    end

    def button_colors(outline: false)
      COLORS.to_h do |color|
        prefix = 'btn'

        css_class = []
        css_class << prefix
        css_class << 'outline' if outline
        css_class << color.to_s

        [color, css_class.join('-')]
      end
    end

    def button_color(context: 'default', **opts)
      button_colors(**opts)[context]
    end
  end
end
