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
    if @user
      return @user.admin
    else
      return false
    end
  end

  def new?
    if @user
      return @user.admin
    else
      return false
    end
  end

  def edit?
    if @user
      return @user.admin
    else
      return false
    end
  end

  def update?
    if @user
      return @user.admin
    else
      return false
    end
  end

  def destroy?
    if @user
      return @user.admin
    else
      return false
    end
  end

  def add?
    return true if @user
  end

  def remove?
    return true if @user
  end
end
