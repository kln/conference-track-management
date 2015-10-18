require 'spec_helper'

describe "session" do
  describe '#has_space?' do
    it 'can add a talk to a session' do
      session = Session.new("morning")
      expect(session.has_space?(180)).to be
    end

    it 'cant add a talk to a session' do
      session = Session.new("morning")
      expect(session.has_space?(181)).to be_falsey
    end
  end

end