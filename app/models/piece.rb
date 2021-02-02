# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  category       :string(20)
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_items_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

class Piece < Item
  include Profilable

  has_one :profile, inverse_of: :piece, class_name: 'Piece::Profile',
                    dependent: :destroy, autosave: true, foreign_key: 'item_id'

  delegate_to_profile :metals, :gemstones, :mountings

  accepts_nested_attributes_for :profile

  class Profile < ApplicationRecord
    # Multiple Table Inheritance (MTI):
    # Contains attributes and relationships unique to pieces
    # Acts as the :piece interface to the outside world

    self.table_name = 'pieces'

    belongs_to :piece, inverse_of: :profile, foreign_key: 'item_id'

    # NOTE: Place all associations unique to Piece below
    has_many :metals,    inverse_of: :piece, foreign_key: 'piece_id'
    has_many :mountings, inverse_of: :piece, foreign_key: 'piece_id'
    has_many :gemstones, through: :mountings,
                         inverse_of: :piece

    accepts_nested_attributes_for :metals, :gemstones, :mountings,
                                  allow_destroy: true, reject_if: :all_blank

    validates_associated :metals, :gemstones
  end
end
