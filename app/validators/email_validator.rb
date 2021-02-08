class EmailValidator < ActiveModel::EachValidator
  # credit: Michael Hartl, Rails Tutorial
  REGEX = /
    \A          # beginning of string
    [\w+\-.]+   # local name
    @           # "@"
    [a-z\d\-.]+ # domain name
    \.          # "."
    [a-z]+      # top-level domain
    \z          # end of string
  /xi           # options: x (free-spacing mode for multi-line), i (turns off case-sensitivity)

  def validate_each(record, attribute, value)
    return if valid_email?(value)

    add_error_to(record, attribute)
  end

  def add_error_to(record, attribute)
    record.errors[attribute] << error_msg
  end

  private

  def valid_email?(value)
    value =~ REGEX
  end

  def error_msg
    options.fetch(:message) { default_error_msg }
  end

  def default_error_msg
    'is not a valid email'
  end
end
