require 'test_helper'

class LookupableDouble
  include ActiveModel::Model
  # needed for UniquenessValidator
  include ActiveRecord::Validations
  # overrides ActiveRecord validators (good for testing) except for
  # UniquenessValidator
  include ActiveModel::Validations
  include Lookupable

  attr_accessor :name

  lookup_attribute :name
end

describe Lookupable do
  # Class methods must be defined before being called
  def self.lookup_values
    []
  end

  subject { LookupableDouble.new }

  context 'validations' do
    # FIXME: Need to be able to test these validations without an ActiveRecord
    # class. The culprit is UniquenessValidator, which calls all sorts of
    # ActiveRecord methods on the object's klass.
    should_eventually validate_presence_of(:name)
    should_eventually validate_uniqueness_of(:name)
    should_eventually validate_length_of(:name).is_at_most(20)
    should_eventually validate_inclusion_of(:name)
      .in_array(lookup_values)
  end

  context 'delegations' do
    should delegate_method(:lookup_table?).to(:class)
    should delegate_method(:lookupable?).to(:class)
  end

  describe '.lookup_table?' do
    it 'returns true' do
      _(subject.class).must_be :lookup_table?
    end
  end
end
