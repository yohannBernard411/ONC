class OrderPolicy < ApplicationPolicy

  attr_reader :user, :comment

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def initialize(user, order)
    @user = user
    @order = order
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def new?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def destroy?
    return true
  end
end
