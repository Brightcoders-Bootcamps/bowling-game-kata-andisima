# frozen_string_literal: true

require './frame.rb'

RSpec.describe 'Frame' do
  let(:frame) { Frame.new }
  describe '#strike?' do
    it 'Will let me know if the turn was a strike or not' do
      frame.turn << 10
      expect(frame.strike?).to be(true)
    end
  end
end