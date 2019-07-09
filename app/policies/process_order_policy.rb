# frozen_string_literal: true

class ProcessOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    admin_validate?
  end

  def update?
    admin_validate?
  end

  private

  def admin_validate?
    if user.nil?
      false
    else
      user.role == 'admin'
    end
  end
end
