class CartPolicy < ApplicationPolicy

  attr_reader :user, :cart

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, cart)
    @user = user
    @cart = cart
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

  def add?
    return true
  end

  def remove?
    return true
  end
end