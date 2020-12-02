# == Schema Information
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  code       :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:code)
  end
end
