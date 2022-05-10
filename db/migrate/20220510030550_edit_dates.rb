class EditDates < ActiveRecord::Migration[7.0]
  def change
    drop_table :dates 

    create_table :dates do |t| 
      t.string :description
      t.timestamps
      t.references :tournament
    end
  end
end
