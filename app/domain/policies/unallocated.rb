module Policies
  class Unallocated
    def self.call(scope, allocated_to: nil) # rubocop:disable Lint/UnusedMethodArgument
      scope.where('content_items.content_id not in (select content_id from allocations)')
    end
  end
end
