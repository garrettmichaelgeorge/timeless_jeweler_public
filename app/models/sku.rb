# Value object for Item stock-keeping units (SKUs)
class SKU
  def initialize(context:)
    @context = context
  end

  def sku
    Formatter.call(subcategory: subcategory,
                   acquired_at_year: acquired_at_year,
                   acquired_at_month: acquired_at_month,
                   id: id,
                   ownership_status_code: ownership_status_code)
  end
  alias to_s sku

  def ==(other)
    sku == other.sku
  end

  def subcategory
    context.subcategory_code || ''
  end

  def acquired_at_year
    context.acquired_at_year.to_s[2..3].to_i
  end

  def acquired_at_month
    context.acquired_at_month
  end

  def id
    context.id || 0
  end

  def ownership_status_code
    context.ownership_status_code || 'T'
  end

  private

  attr_reader :context

  # Actually performs the SKU string formatting
  module Formatter
    STR_LENGTHS = {
      subcategory: 2,
      acquired_at_year: 2,
      acquired_at_month: 2,
      id: 4,
      ownership_status_code: 1
    }.freeze

    class << self
      def call(...)
        format(format_string, ...)
      end

      def format_string
        '%<subcategory>s' \
        "%0#{STR_LENGTHS[:acquired_at_year]}<acquired_at_year>d" \
        "%0#{STR_LENGTHS[:acquired_at_month]}<acquired_at_month>d" \
        "%0#{STR_LENGTHS[:id]}<id>d" \
        '%1<ownership_status_code>c'
      end
    end
  end
end
