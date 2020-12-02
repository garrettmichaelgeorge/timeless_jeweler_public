class ItemValidator
  def self.validate(item)
    new(item).validate
  end

  def initialize(item)
    @item = item
  end

  def validate
    result = Result.new
    result << validate_name
    result
  end

  private

  attr_reader :item

  def validate_name
    "Name can't be empty." if name_empty?
  end

  def name_empty?
    item.name.blank?
  end

  class Result
    attr_reader :messages

    def initialize
      @messages = []
    end

    def okay?
      messages.empty?
    end

    def <<(message)
      @messages << message if message
    end
  end
end
