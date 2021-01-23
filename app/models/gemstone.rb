# == Schema Information
#
# Table name: gemstone_profiles
#
#  id                   :bigint           not null, primary key
#  carat                :decimal(, )
#  role                 :string(20)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstone_profiles_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#

class Gemstone < ApplicationRecord
  self.table_name = 'gemstone_profiles'

  self.inheritance_column = 'role'

  ROLES = %w[Listed Mounted].freeze

  belongs_to :category,     inverse_of: :gemstones, foreign_key: :gemstone_category_id

  has_one :cut_grading,     inverse_of: :diamond,  class_name: 'Diamond::Cut::Grading'
  has_one :cut,             through: :cut_grading, class_name: 'Diamond::Cut'

  has_one :color_grading,   inverse_of: :diamond,    class_name: 'Diamond::Color::Grading'
  has_one :color,           through: :color_grading, class_name: 'Diamond::Color'

  has_one :clarity_grading, inverse_of: :diamond,      class_name: 'Diamond::Clarity::Grading'
  has_one :clarity,         through: :clarity_grading, class_name: 'Diamond::Clarity'

  scope :loose,   -> { where(role: 'Loose') }
  scope :mounted, -> { where(role: 'Mounted') }
  scope :diamonds, -> { joins(:category).where('gemstone_category.name = ?', 'Diamond') }

  validates :role, presence: true, length: { maximum: 20 },
                   inclusion: ROLES

  delegate :name,  to: :category, prefix: true
  delegate :grade, to: :cut,      prefix: true
  delegate :grade, to: :color,    prefix: true
  delegate :grade, to: :clarity,  prefix: true

  class << self
    def categories
      subclasses.map(&:to_s).sort
    end
  end

  class Listed < Gemstone
    has_one :listing, inverse_of: :gemstone,
                      class_name: 'LooseGemstone::Profile'
  end

  class Mounted < Gemstone
    has_one :mounting, inverse_of: :gemstone, class_name: 'Mounting'
    has_one :piece,    through:    :mounting
  end
end
