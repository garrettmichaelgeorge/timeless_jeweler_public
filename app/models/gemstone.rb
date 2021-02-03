# == Schema Information
#
# Table name: gemstones
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
#  index_gemstones_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#

class Gemstone < ApplicationRecord
  self.inheritance_column = 'role'

  ROLES = %w[Gemstone::Listed Gemstone::Mounted].freeze

  belongs_to :category,     inverse_of: :gemstones,
                            foreign_key: :gemstone_category_id

  has_many :reports,        inverse_of: :gemstone, class_name: 'Gemstone::Report'

  has_one :cut_grading,     inverse_of: :diamond,
                            class_name: 'Diamond::Cut::Grading', foreign_key: 'gemstone_profile_id'
  has_one :cut,             through: :cut_grading,
                            class_name: 'Diamond::Cut'

  has_one :color_grading,   inverse_of: :diamond,
                            class_name: 'Diamond::Color::Grading', foreign_key: 'gemstone_profile_id'
  has_one :color,           through: :color_grading,
                            class_name: 'Diamond::Color'

  has_one :clarity_grading, inverse_of: :diamond,
                            class_name: 'Diamond::Clarity::Grading', foreign_key: 'gemstone_profile_id'
  has_one :clarity,         through: :clarity_grading,
                            class_name: 'Diamond::Clarity'

  scope :listed,   -> { where(role: 'Listed') }
  scope :mounted,  -> { where(role: 'Mounted') }
  scope :diamonds, -> { joins(:category).where('gemstone_category.name = ?', 'Diamond') }

  validates :role, presence: true, length: { maximum: 20 },
                   inclusion: ROLES

  delegate :grade, to: :cut,      prefix: true, allow_nil: true
  delegate :grade, to: :color,    prefix: true, allow_nil: true
  delegate :grade, to: :clarity,  prefix: true, allow_nil: true
  delegate :name,  to: :category, prefix: true

  class Listed < Gemstone
    has_one :listing, inverse_of: :gemstone,
                      class_name: 'LooseGemstone::Profile',
                      foreign_key: 'gemstone_profile_id'
  end

  class Mounted < Gemstone
    has_one :mounting, inverse_of: :gemstone
    has_one :piece,    through:    :mounting, inverse_of: :gemstones
  end
end
