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
    return true if @user
  end

  def new?
    return true if @user
  end

  def edit?
    return unless @user
    return true if @user.admin || @user.id == @comment.user_id
  end

  def update?
    return unless @user
    return true if @user.admin || @user.id == @comment.user_id
  end

  def destroy?
    return unless @user
    return true if @user.admin || @user.id == @comment.user_id
  end
end
