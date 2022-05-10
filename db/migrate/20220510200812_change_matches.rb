class ChangeMatches < ActiveRecord::Migration[7.0]
  def change
    change_table :matches do |t| 
      t.remove :home_id 
      t.remove :away_id 

      t.references :home, index: true, foreign_key: {to_table: :teams}
      t.references :away, index: true, foreign_key: {to_table: :teams}
    end
  end
end
