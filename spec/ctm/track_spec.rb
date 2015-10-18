require 'spec_helper'

describe "track" do
  describe '#insert_talks_on_track' do
    it 'should insert talks on track correctly' do
      talk_lists = {}

      File.readlines("./spec/test_talk_list.txt").each do |line|
        t = Talk.new(line.strip)
        talk_lists[t.title] = t.length
      end

      track = Track.new
      track.insert_talks_on_track(talk_lists)
      expect(track.morning_sessions.time <= Time.parse("12:00")).to be
      expect(track.afternoon_sessions.time >= Time.parse("13:00")).to be
      expect(track.afternoon_sessions.time <= Time.parse("17:00")).to be
    end
  end
end