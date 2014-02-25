require "pebbles/tokyu_ruby_kaigi/version"
require "active_support/core_ext"
require "google_holiday_calendar"

module Pebbles
  module TokyuRubyKaigi
    MEET_DAY = 29

    def find
      meet_date = Date.today.day < MEET_DAY ? next_meet_date(Date.today) : next_meet_date(1.month.past)

      loop do
        return meet_date if meet_date.saturday? || meet_date.sunday? || holiday?(meet_date)
        meet_date = next_meet_date(meet_date + 1.month)
      end
    end

    private
    def next_meet_date(date)
      meet_date = date.change(day: MEET_DAY)
      meet_date
    rescue ArgumentError
      # there is not meet day in February
      date += 1.month
      retry
    end

    def holiday?(date)
      calendar = GoogleHolidayCalendar::Calendar.new(country: "japanese", lang: "ja")
      next_holiday = calendar.holidays(start_date: date, end_date: date+1.month, limit: 1).first.first
      date == next_holiday
    end
  end
end
