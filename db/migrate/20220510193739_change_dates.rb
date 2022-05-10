class ChangeDates < ActiveRecord::Migration[7.0]
  def change
    drop_table :dates 

    create_table :match_days do |t|
      t.string :description
      t.timestamps
      t.references :tournament
    end

    change_table :matches do |t| 
      t.remove :date_id
      t.references :match_day
    end
  end
end
