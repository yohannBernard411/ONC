class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def initialize(user, comment)
    @user = user
    @comment = comment
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
