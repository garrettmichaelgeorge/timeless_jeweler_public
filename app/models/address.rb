class Address < ApplicationRecord

  before_validation :upcase_state_province

  private

  # Converts state_province to all uppercase
  def upcase_state_province
    puts 'Upcasing address.state_province'
    self.state_province = state_province.upcase
  end

end
