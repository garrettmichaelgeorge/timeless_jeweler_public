class Person < ApplicationRecord
  acts_as :party
  after_find do |person|
  end
  
  after_initialize do |person|
    @last_name = person.last_name
    self.build_party if party.nil?
  end
  
  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, length: { maximum: 40 }

  belongs_to :household, optional: true, counter_cache: :count_of_members

  def create_household_from_last_name!
    # Create an associated household using the person's last name as
    # the household name unless the person already has a household
    puts ""
    puts "Creating new household from last name: \"#{@last_name}\""
    puts ""
    self.create_household!(household_name: @last_name) unless self.household
  end
end
