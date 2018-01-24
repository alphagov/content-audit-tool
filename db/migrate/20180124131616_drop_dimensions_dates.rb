class DropDimensionsDates < ActiveRecord::Migration[5.1]
  def change
    drop_table :dimensions_dates do |t|
      t.string "date_name", null: false
      t.string "date_name_abbreviated", null: false
      t.integer "year", null: false
      t.integer "quarter", null: false
      t.integer "month", null: false
      t.string "month_name", null: false
      t.string "month_name_abbreviated", null: false
      t.integer "week", null: false
      t.integer "day_of_year", null: false
      t.integer "day_of_quarter", null: false
      t.integer "day_of_month", null: false
      t.integer "day_of_week", null: false
      t.string "day_name", null: false
      t.string "day_name_abbreviated", null: false
      t.string "weekday_weekend", null: false
      t.timestamps null: false
    end
  end
end
