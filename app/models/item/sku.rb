class Item
  class SKU
    # Value object for Item stock-keeping units (SKUs)

    def initialize(context:)
      @context = context
    end

    def to_s
      # implementation options:
      # 1. string interpolation
      # 2. sprintf()
      #   Read more:
      #   https://rubydocs.org/d/ruby-3-0-0/classes/Kernel.html#method-i-sprintf
      #   https://rubystyle.guide/#sprintf

      "#{item_type}#{year}#{month}#{item_no}#{owner}"
    end

    def item_type
      # TODO: implement
      'BR'
    end

    def year
      item_date.year.to_s[2, 3]
    end

    def month
      item_date.month
    end

    def item_no
      # TODO: implement
      '1001'
    end

    def owner
      # TODO: implement
      'T'
    end

    private

    attr_reader :context

    def item_date
      context.created_at
    end
  end
end
