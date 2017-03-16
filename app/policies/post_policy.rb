class PostPolicy < ApplicationPolicy
  attr_reader :current_user, :record
  def initialize(current_user, record)
    @user = current_user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.nil?
  end

  def new?
    !user.nil?
  end

  def update?
    !user.nil?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
