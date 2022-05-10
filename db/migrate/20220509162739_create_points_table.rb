class CreatePointsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t| 
      t.integer :total_points 
      t.timestamps
      t.references :tournament
      t.references :player
    end
  end
end
