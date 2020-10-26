class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, article)
    @user = user
    @article = article
  end

  def label
    return true
  end

  def lin
    return true
  end
end
