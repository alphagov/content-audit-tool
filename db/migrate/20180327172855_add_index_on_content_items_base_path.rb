class AddIndexOnContentItemsBasePath < ActiveRecord::Migration[5.1]
  def change
    add_index :content_items, [:base_path], name: "index_content_items_on_base_path"
  end
end
