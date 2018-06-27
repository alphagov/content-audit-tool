class AddIndexesToLinksLinkTypeTargetId < ActiveRecord::Migration[5.1]
  def change
    add_index :links, %i(link_type target_content_id)
    add_index :links, %i(link_type source_content_id)
  end
end
