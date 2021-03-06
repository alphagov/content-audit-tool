class User < ApplicationRecord
  include GDS::SSO::User

  serialize :permissions, Array

  def organisation
    @organisation ||= Item.find_by(content_id: organisation_content_id)
  end
end
