# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  delegate :lookup_table?, :lookupable?, to: :class

  class << self
    def lookup_table?
      false
    end
    alias lookupable? lookup_table?
  end
end
