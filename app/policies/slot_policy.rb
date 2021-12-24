class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def lastweek?
      true
    end

    def nextweek?
      true
    end
  end
end
