class AddTimestampPlayers < ActiveRecord::Migration[7.0]
  def change
    change_table :players do |t|
      t.timestamps
    end
  end
end
