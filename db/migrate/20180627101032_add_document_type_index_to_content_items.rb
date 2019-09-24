class AddDocumentTypeIndexToContentItems < ActiveRecord::Migration[5.1]
  def change
    add_index :content_items, %i(document_type content_id six_months_page_views), name: "index_content_items_on_document_type_content_id_ordered"
  end
end
