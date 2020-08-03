class DeliveryAdressPolicy < ApplicationPolicy

  attr_reader :user, :delivery_adress

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, delivery_adress)
    @user = user
    @delivery_adress = delivery_adress
  end

  def index?
  end

  def show?

  end

  def create?
    if @user
      return true
    end
  end

  def new?
    if @user
      return true
    end
  end

  def edit?

  end

  def update?

  end

  def destroy?

  end

end