class DropDimensionsItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :dimensions_items do |t|
      t.string "content_id"
      t.string "title"
      t.string "link"
      t.string "description"
      t.string "organisation_id"
      t.timestamps null: false
    end
  end
end
