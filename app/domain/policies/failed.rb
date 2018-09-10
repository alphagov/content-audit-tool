module Policies
  class Failed
    def self.call(scope)
      scope.joins(:audit).merge(Audit.failing)
    end
  end
end
