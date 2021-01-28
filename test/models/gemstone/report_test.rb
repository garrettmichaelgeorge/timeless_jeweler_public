# == Schema Information
#
# Table name: gemstone_reports
#
#  id          :bigint           not null, primary key
#  file_url    :string
#  report_no   :string           not null
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gemstone_id :bigint           not null
#
# Indexes
#
#  index_gemstone_reports_on_gemstone_id  (gemstone_id)
#  index_gemstone_reports_on_report_no    (report_no) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_id => gemstones.id)
#

require 'test_helper'

class Gemstone
  class ReportTest < ActiveSupport::TestCase
    subject { build(:gemstone_report) }

    context 'associations' do
      should belong_to(:gemstone)
    end

    context 'validations' do
      should validate_presence_of(:report_no)
      should validate_uniqueness_of(:report_no)
    end
  end
end
