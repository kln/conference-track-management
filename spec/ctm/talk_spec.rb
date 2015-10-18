require 'spec_helper'

describe "talk" do
  context 'talks with length greater than 5 minutes' do
    it 'should be return talk title and length correctly' do
      talk_title = "Evoluindo uma aplicação com uso do Elasticsearch"
      talk = new_talk("40min", talk_title)

      expect(talk.title).to eq(talk_title)
      expect(talk.length).to eq(40)
    end
  end

  context 'lightning' do
    it 'should be return lightning talk title and length correctly' do
      talk = new_talk("lightning")
      expect(talk.length).to eq(5)
    end
  end

  context 'talks with invalid length' do
    it 'should be return a error' do
      expect{ new_talk("lighnting") }.to raise_error(ArgumentError)
    end
  end

  context 'description' do
    before do
      @talk_lists = {
                "Talk legal" => 240,
                "Talk cool" => 180,
                "Talk fresc" => 180,
                "Talk koel" => 240
              }
    end

    describe "#update_talk_lists" do
      it "should update talk lists after insert in track" do
       talk_lists = @talk_lists.dup

       track1 = Track.new
       track1.morning_sessions.talks << "09:00 Talk cool 180min"
       track1.afternoon_sessions.talks << "13:00 Talk legal 240min"

       talk_lists = Talk.update_talk_lists(talk_lists, track1)
       expect(talk_lists.count).to eq(2)
      end
    end

    describe "#quantity_of_tracks" do
      it "should return 3" do
        t = Talk.quantity_of_tracks(@talk_lists)
        expect(t).to eq(2)
      end
    end
  end

  private
    def new_talk(length, title=nil)
      title ||= "Not-Entreprise Message Bus"
      Talk.new("#{title} #{length}")
    end
end