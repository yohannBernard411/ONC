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
    if @user
      return @user.admin
    end
  end

  def show?
    if @user
      return @user.id == @cart.user_id
    end
  end

  def create?
    
  end

  def new?

  end

  def edit?

  end

  def update?

  end

  def destroy?

  end

end
