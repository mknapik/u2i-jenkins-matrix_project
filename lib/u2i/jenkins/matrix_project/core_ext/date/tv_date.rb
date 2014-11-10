require 'u2i/jenkins/matrix_project/core_ext/support'

class Date
  def beginning_of_airing_day(day_start_hour, time_zone)
    with_time_zone(time_zone) do
      Time.local(year, month, day, day_start_hour, 0, 0, 0)
    end.utc
  end

  private

  def with_time_zone(tz_name)
    prev_tz = ENV['TZ']
    ENV['TZ'] = tz_name
    yield
  ensure
    ENV['TZ'] = prev_tz
  end
end
