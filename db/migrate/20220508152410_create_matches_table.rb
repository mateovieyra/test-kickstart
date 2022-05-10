class CreateMatchesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :result 
      t.integer :goals_home
      t.integer :goals_away
      t.datetime :datetime 
      t.string :type
      t.timestamps
      t.references :home, class_name: "Team"
      t.references :away, class_name: "Team"  
      t.references :date
    end
  end
end
