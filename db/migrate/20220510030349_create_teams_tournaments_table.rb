class CreateTeamsTournamentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :teams_tournaments do |t| 
      t.timestamps
      t.references :team 
      t.references :tournament
    end
  end
end
