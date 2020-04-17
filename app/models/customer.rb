class Customer < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :gender, length: { is: 1 }
  validates :ring_size, presence: false, numericality: { allow_nil: true }
  validates :necklace_length, numericality: { allow_nil: true }

  belongs_to :household
  # validates_associated :household
  accepts_nested_attributes_for :household

  has_many :products
end
