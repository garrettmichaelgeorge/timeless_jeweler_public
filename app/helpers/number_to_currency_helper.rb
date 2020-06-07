module NumberToCurrencyHelper
  def number_to_currency
    if self.empty?
      raw "&ndash;"
    else
      ActionController::Base.helpers.number_to_currency(self)
      # self
    end
  end
end
