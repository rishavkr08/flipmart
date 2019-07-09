# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user_validate?
  end

  private

  def user_validate?
    if user.nil?
      false
    else
      user.role == 'user'
    end
  end
end
