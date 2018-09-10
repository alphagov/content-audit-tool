module Policies
  class Unallocated
    def self.call(scope, allocated_to: nil) # rubocop:disable Lint/UnusedMethodArgument
      scope.left_outer_joins(:allocation).where(allocations: { content_id: nil })
    end
  end
end
