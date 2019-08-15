class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user || record.cat.user == user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    record.user == user || record.cat.user == user
  end

  def edit?
    true
  end

  def update?
    record.user == user
  end
end
