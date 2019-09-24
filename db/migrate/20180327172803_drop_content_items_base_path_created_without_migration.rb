class DropContentItemsBasePathCreatedWithoutMigration < ActiveRecord::Migration[5.1]
  def up
    if index_exists?(:content_items, [:base_path], name: "idx_cnt_bp")
      remove_index :content_items, name: "idx_cnt_bp"
    end
  end
end
