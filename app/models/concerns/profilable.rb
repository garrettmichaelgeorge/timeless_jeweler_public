module Profilable
  extend ActiveSupport::Concern

  included do
    delegate_missing_to :profile

    after_initialize do
      build_profile if profile.nil?
    end
  end
end
