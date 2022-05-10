class CreateDatesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :dates do |t| 
      t.string :description
      t.timestamps
      t.references :tournaments
    end
  end
end
