class AddressPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def edit?
      update?
    end
    def update?
      record.user == user
    end

  end
end
