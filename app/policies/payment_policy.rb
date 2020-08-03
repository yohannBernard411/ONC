class PaymentPolicy < ApplicationPolicy

  attr_reader :user, :payment

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, payment)
    @user = user
    @payment = payment
  end

  def index?

  end

  def show?

  end

  def create?

  end

  def new?
    return true if @user
  end

  def edit?

  end

  def update?

  end

  def destroy?

  end
end
