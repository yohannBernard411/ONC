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

  end

  def new?
    return true if @user
  end

  def edit?
    if @user
      if @user.admin || @user.id == @comment.user_id
        return true
      else
        return false
      end
    end
  end

  def update?

  end

  def destroy?
    if @user
      if @user.admin || @user.id == @comment.user_id
        return true
      else
        return false
      end
    end
  end
end
