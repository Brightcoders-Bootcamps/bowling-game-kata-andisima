# frozen_string_literal: true

require './bowling_game'

RSpec.describe 'Bowling' do
  let(:bowling) { Bowling.new }
  describe 'roll' do
    it 'it will let me know the pins down' do
      expect(bowling.roll(10)).to be_kind_of(Frame)
    end
  end

  describe 'done?' do
    it 'Tells me if the turn is done' do
      frame = Frame.new
      expect(frame.done?).to be(true).or be(false)
    end
  end
end
