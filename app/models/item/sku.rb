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

    def to_s
      # implementation options:
      # 1. string interpolation
      # 2. sprintf()
      #   Read more:
      #   https://rubydocs.org/d/ruby-3-0-0/classes/Kernel.html#method-i-sprintf
      #   https://rubystyle.guide/#sprintf

      # "#{subcategory}#{year}#{month}#{id}#{ownership_status_code}"

      format("%<subcategory>s%0#{LENGTHS[:year]}<year>d%0#{LENGTHS[:month]}<month>d%0#{LENGTHS[:id]}<id>d%1<ownership_status_code>c",
             subcategory: subcategory,
             year: year,
             month: month,
             id: id,
             ownership_status_code: ownership_status_code)
    end
    alias sku to_s

    def subcategory
      context.subcategory_code
    end

    def year
      item_date.strftime('%y')
    end

    def month
      item_date.strftime('%m')
    end

    def id
      context.id
    end

    def ownership_status_code
      context.ownership_status_code
    end

    private

    attr_reader :context

    def item_date
      context.acquired_at
    end
  end
end
