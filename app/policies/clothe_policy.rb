class ClothePolicy < ApplicationPolicy
  attr_reader :user, :clothe

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, clothe)
    @user = user
    @clothe = clothe
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return @user.admin if @user
  end

  def new?
    return @user.admin if @user
  end

  def edit?
    return @user.admin if @user
  end

  def update?
    return @user.admin if @user
  end

  def destroy?
    return @user.admin if @user
  end

  def add?
    return true if @user
  end

  def remove?
    return true if @user
  end
end
