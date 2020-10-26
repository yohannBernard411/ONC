class LineItemPolicy < ApplicationPolicy
  attr_reader :user, :line_item

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, line_item)
    @user = user
    @line_item = line_item
  end

  def index?
    return unless @user

    return @user.admin
  end

  def show?
    return unless @user

    return unless @user.admin || @user.id == @line_item.user_id
  end

  def create?
    return @user
  end

  def new?
    return @user
  end

  def edit?
  end

  def update?
  end

  def destroy?
    return unless @user

    return unless @user.admin || @user.id == Cart.find(@line_item.cart_id).user_id
  end

  def prev?
    @user.admin
  end

  def next?
    @user.admin
  end

  def up?
    @user
  end

  def down?
    @user
  end
end
