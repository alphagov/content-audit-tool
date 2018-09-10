module Policies
  class NonAudited
    def self.call(scope)
      unless scope.joins_values.include?(:audit)
        scope = scope.left_outer_joins(:audit)
      end

      scope.where(audits: { content_id: nil })
    end
  end
end
