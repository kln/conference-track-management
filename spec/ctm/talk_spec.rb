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

  private
    def new_talk(length, title=nil)
      title ||= "Not-Entreprise Message Bus"
      Talk.new("#{title} #{length}")
    end
end