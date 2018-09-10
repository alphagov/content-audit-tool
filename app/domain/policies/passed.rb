module Policies
  class Passed
    def self.call(scope)
      scope.joins(:audit).merge(Audit.passing)
    end
  end
end
