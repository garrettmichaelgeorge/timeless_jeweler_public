class SKUableDouble
  attr_accessor :subcategory_code, :acquired_at, :id, :ownership_status_code

  def initialize(subcategory_code: nil,
                 acquired_at: Time.now,
                 id: nil,
                 ownership_status_code: nil)
    @subcategory_code = subcategory_code
    @acquired_at = acquired_at
    @id = id
    @ownership_status_code = ownership_status_code
  end

  def acquired_at_month = acquired_at.month

  def acquired_at_year = acquired_at.year

  def acquired_at_month=(value)
    self.acquired_at = self.acquired_at.change(month: value)
  end

  def acquired_at_year=(value)
    self.acquired_at = self.acquired_at.change(year: value)
  end
end
