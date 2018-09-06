class AddIndexToContentItemsDocumentType < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :content_items, :document_type, algorithm: :concurrently
  end
end
