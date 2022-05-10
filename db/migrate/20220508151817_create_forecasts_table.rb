class CreateForecastsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.string :result
      t.integer :goals_home 
      t.integer :goals_away
      t.integer :points 
      t.timestamps
      t.references :player
      t.references :match
      t.references :tournament 
    end
    
  end
end
