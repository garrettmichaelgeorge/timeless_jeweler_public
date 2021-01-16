class ItemPolicy < ApplicationPolicy
  def show?
    merchant.items.include? resource
  end

  private

  def merchant
    user.merchant
  end
end
