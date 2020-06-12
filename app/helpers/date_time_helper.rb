module DateTimeHelper
  def format_datetime_with_slashes(datetime)
    datetime.strftime('%m/%d/%y')
  end
end
