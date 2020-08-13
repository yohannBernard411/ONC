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
    if @user
      return @user.admin
    end
  end

  def show?
    if @user
      if @user.admin || @user.id == @line_item.user_id
        return true
      end
    end
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
    if @user
      if @user.admin || @user.id == @line_item.user_id
        return true
      end
    end
  end

end