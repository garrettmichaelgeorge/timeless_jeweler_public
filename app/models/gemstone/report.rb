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

class Gemstone
  class Report < ApplicationRecord
    self.table_name = 'gemstone_reports'

    belongs_to :gemstone, inverse_of: :reports

    validates :report_no, presence: true,
                          uniqueness: true
  end
end
