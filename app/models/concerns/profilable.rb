module Profilable
  extend ActiveSupport::Concern

  included do
    scope :with_profile, -> { joins(:lazily_built_profile) }

    validates_associated :profile
  end

  class_methods do
    def delegate_to_profile(*methods, **opts)
      delegate(*methods, to: :lazily_built_profile, **opts)
    end
  end

  private

  def lazily_built_profile
    profile || build_profile
  end
end
