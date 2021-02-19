class Item
  class SKU
    # Value object for Item stock-keeping units (SKUs)

    LENGTHS = {
      subcategory: 2,
      year: 2,
      month: 2,
      id: 4,
      ownership_status_code: 1
    }.freeze

    def initialize(context:)
      @context = context
    end

    def sku
      #   https://rubydocs.org/d/ruby-3-0-0/classes/Kernel.html#method-i-sprintf
      #   https://rubystyle.guide/#sprintf

      # HACK
      format(format_string, subcategory: subcategory,
                            year: year,
                            month: month,
                            id: id,
                            ownership_status_code: ownership_status_code)
    end
    alias to_s sku

    def ==(other)
      sku == other.sku
    end

    def subcategory
      # HACK
      context.subcategory_code || ' '
    end

    def year
      # HACK
      item_date&.strftime('%y') || 0
    end

    def month
      # HACK
      item_date&.strftime('%m') || 0
    end

    def id
      # HACK
      context.id || 0
    end

    def ownership_status_code
      # HACK
      context.ownership_status_code || ' '
    end

    private

    attr_reader :context

    def format_string
      '%<subcategory>s' \
        "%0#{LENGTHS[:year]}<year>d" \
        "%0#{LENGTHS[:month]}<month>d" \
        "%0#{LENGTHS[:id]}<id>d" \
        '%1<ownership_status_code>c'
    end

    def item_date
      context.acquired_at
    end
  end
end
