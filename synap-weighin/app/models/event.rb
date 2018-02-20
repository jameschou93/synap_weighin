class Event < ActiveRecord::Base
  default_scope { order(created_at: :asc) }

  has_many :checkins
  has_many :leagues
  has_many :people, -> { distinct }, through: :checkins
end
