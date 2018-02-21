class Event < ActiveRecord::Base
  default_scope { order(created_at: :asc) }

  has_many :checkins
  has_many :event_league_joins, class_name: EventLeagueJoins
  has_many :leagues, through: :event_league_joins
  has_many :people, -> { distinct }, through: :checkins
end
