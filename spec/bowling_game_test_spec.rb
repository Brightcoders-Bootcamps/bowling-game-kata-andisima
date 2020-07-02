# frozen_string_literal: true

require './bowling_game'

RSpec.describe 'Bowling' do
  describe 'roll' do
    it 'it will let me know the pins down' do
      bowling = Bowling.new
      bowling.roll(10)
      expect(bowling.roll(10)).to be_kind_of(Array)
    end
  end

  describe 'score' do
    it 'will give me the total amount of pins summed I have, counting bonus' do
      bowling = Bowling.new
      bowling.score
      expect(bowling.score).to be_kind_of(Integer)
    end
  end

  describe 'done?' do
    it 'Tells me if the turn is done' do
      bowling = Bowling.new
      frame = Frame.new
      frame.done?
      expect(frame.done?).to be(true).or be(false)
    end
  end

  describe 'score' do
    it 'gives me the points per turn' do
      bowling = Bowling.new
      bowling.score
      # frame = Frame.new
      # frame.score
      expect(bowling.score).to be_kind_of(Integer)
    end
  end
end
