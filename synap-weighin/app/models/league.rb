class League < ActiveRecord::Base
  has_many :users
  has_many :people
  has_many :event_league_joins, class_name: EventLeagueJoins
  has_many :events, through: :event_league_joins

end
