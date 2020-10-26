class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order

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
  end

  def show?
  end

  def create?
    return unless @user

    return true
  end

  def new?
    return true if @user
  end

  def edit?
  end

  def update?
  end

  def destroy?
  end
end
