class CreateEventLeagueJoins < ActiveRecord::Migration
  def change
    create_table :event_league_joins do |t|
      t.integer :league_id, null: false
      t.integer :event_id,  null: false

      t.timestamps
    end
  end
end
