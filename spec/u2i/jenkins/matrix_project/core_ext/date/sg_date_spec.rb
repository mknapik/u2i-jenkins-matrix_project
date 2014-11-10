require 'spec_helper'

describe Date do
  TIME_OFFSET = 5

  let(:time_zone) { 'America/New_York' }

  describe '#beginning_of_airing_day' do
    it 'should return beginning_of_airing_day offset for UTC' do
      expect(Date.parse('2013-07-08').beginning_of_airing_day(TIME_OFFSET, 'UTC')).to eq(Time.parse('2013-07-08 5:00 UTC'))
    end

    it 'should return beginning_of_airing_day for standard time (ET)' do
      expect(Date.parse('2014-03-08').beginning_of_airing_day(TIME_OFFSET, time_zone)).to eq(Time.parse('2014-03-08 10:00 UTC'))
    end

    it 'should return beginning_of_airing_day for daylight saving time' do
      expect(Date.parse('2014-03-09').beginning_of_airing_day(TIME_OFFSET, time_zone)).to eq(Time.parse('2014-03-09 09:00 UTC'))
    end

    it 'should return beginning_of_airing_day for daylight saving time' do
      expect(Date.parse('2014-11-01').beginning_of_airing_day(TIME_OFFSET, time_zone)).to eq(Time.parse('2014-11-01 09:00 UTC'))
    end

    it 'should return beginning_of_airing_day for standard time (ET)' do
      expect(Date.parse('2014-11-02').beginning_of_airing_day(TIME_OFFSET, time_zone)).to eq(Time.parse('2014-11-02 10:00 UTC'))
    end
  end
end
