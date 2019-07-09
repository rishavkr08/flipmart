class CartProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    user_validate?
  end

  def show?
    user_validate?
  end

  def create?
    user_validate?
  end

  def destroy
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
