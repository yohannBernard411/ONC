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

  end

  def show?

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
