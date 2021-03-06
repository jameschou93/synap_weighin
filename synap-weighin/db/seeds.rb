require 'csv'

5.times do
  League.create(name: "Team " + Faker::RickAndMorty.character)
end

League.all.each do |league|
  10.times do
    EventLeagueJoins.create(league_id: league.id, event_id: rand(1..95))
  end
end
csv_text = File.read('weighins.csv')
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
people = []
events = []
checkins = []

csv.each do |row|
  people.insert(-1,row['Name'])
  events.insert(-1,row['Event'])
end

people.uniq!.each do |person|
  Person.create(name: person)
end

events.uniq!.each do |event|
  Event.create(name: event, tagline: Faker::Lorem.word)
end

csv.each do |row|
  x = Checkin.new
  x.person_id = Person.find_by_name(row['Name']).id
  x.event_id = Event.find_by_name(row['Event']).id
  x.weight = row['Weight'].to_i
  x.created_at = row['Time']
  x.save
end

Person.all.each do |x|
  x.update(starting_weight: x.checkins.first.weight, league_id: rand(1..5))
end
