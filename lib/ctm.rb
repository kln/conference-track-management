require "./lib/ctm/track"
require "./lib/ctm/session"
require "./lib/ctm/talk"

file = ARGV.first

talk_lists = {}

File.readlines(file).each do |line|
  t = Talk.new(line.strip)
  talk_lists[t.title] = t.length
end

number_of_tracks_needed = Talk.quantity_of_tracks(talk_lists)

number_of_tracks_needed.times do |n|
  puts
  puts "TRACK #{n + 1}"

  track = Track.new
  track.insert_talks_on_track(talk_lists)

  talk_lists = Talk.update_talk_lists(talk_lists, track)

  puts "- MORNING SESSION"
  puts track.morning_sessions.talks
  puts "12:00 Lunch"
  puts "- AFTERNOON SESSION"
  puts track.afternoon_sessions.talks
  puts "#{track.afternoon_sessions.network_time} Networking Event"
  puts "==============================="

end
