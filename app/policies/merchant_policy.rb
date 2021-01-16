class MerchantPolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
