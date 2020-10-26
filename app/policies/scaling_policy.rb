class ScalingPolicy < ApplicationPolicy
  attr_reader :user, :scaling

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, scaling)
    @user = user
    @scaling = scaling
  end

  def index?
  end

  def show?
  end

  def create?
    return @user.admin
  end

  def new?
  end

  def edit?
  end

  def update?
  end

  def destroy?
    return @user.admin
  end
end
