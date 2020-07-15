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
