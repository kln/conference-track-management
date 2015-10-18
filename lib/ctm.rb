require "./lib/ctm/track"
require "./lib/ctm/session"
require "./lib/ctm/talk"

file = ARGV.first

talk_lists = {}

File.readlines(file).each do |line|
  t = Talk.new(line.strip)
  talk_lists[t.title] = t.length
end

total_length_talks = talk_lists.values.reduce(:+)
number_of_tracks_needed = Track.new.quantity_needed(total_length_talks)

number_of_tracks_needed.times do |track|
  puts
  puts "TRACK #{track + 1}"

  morning_session   = Session.new("morning")
  afternoon_session = Session.new("afternoon")

  talk_lists.each do |title, length|
    if morning_session.has_space?(length)
      morning_session.add(title, length)
      talk_lists.delete(title)
    elsif afternoon_session.has_space?(length)
      afternoon_session.add(title, length)
      talk_lists.delete(title)
    end
  end

  puts "- MORNING SESSION"
  puts morning_session.talks
  puts "12:00 Lunch"
  puts "- AFTERNOON SESSION"
  puts afternoon_session.talks
  puts "#{afternoon_session.network_time} Networking Event"
  puts "==============================="

end
