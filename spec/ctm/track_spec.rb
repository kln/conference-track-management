require 'spec_helper'

describe "track" do
  describe "#quantity_needed" do
    it "should return 3" do
      t = Track.new.quantity_needed(1200)
      expect(t).to eq(3)
    end
  end
end