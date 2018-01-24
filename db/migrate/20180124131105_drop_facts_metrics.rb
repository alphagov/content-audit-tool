class DropFactsMetrics < ActiveRecord::Migration[5.1]
  def change
    drop_table :facts_metrics do |t|
      t.date "dimensions_date_id"
      t.bigint "dimensions_item_id"
      t.bigint "dimensions_organisation_id"
      t.timestamps null: false
    end
  end
end
