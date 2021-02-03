module Profilable
  extend ActiveSupport::Concern

  included do
    after_initialize do
      build_profile if profile.nil?
    end

    scope :with_profile, -> { includes(:profile) }

    validates_associated :profile

    accepts_nested_attributes_for :profile
  end

  class_methods do
    def delegate_to_profile(*methods, **opts)
      delegate(*methods, to: :profile, **opts)
    end
  end
end
