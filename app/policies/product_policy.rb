# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    admin_validate?
  end

  def create
    admin_validate?
  end

  def new
    create?
  end

  def update?
    admin_validate?
  end

  # alias_method :update?, :edit?

  def show?
    admin_validate?
  end

  def view_product?
    admin_validate?
  end

  def destroy?
    admin_validate?
  end

  private

  def admin_validate?
    #   binding.pry
    if user.nil?
      false
    else
      user.role == 'admin'
    end
  end
end
