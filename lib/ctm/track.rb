class Track
  attr_reader :morning_sessions
  attr_reader :afternoon_sessions

  def initialize
    @morning_sessions   = Session.new("morning")
    @afternoon_sessions = Session.new("afternoon")
  end

  def insert_talks_on_track(talk_lists)
    talk_lists.each do |title, length|
      if @morning_sessions.has_space?(length)
        @morning_sessions.add(title, length)
      elsif @afternoon_sessions.has_space?(length)
        @afternoon_sessions.add(title, length)
      end
    end
  end
end