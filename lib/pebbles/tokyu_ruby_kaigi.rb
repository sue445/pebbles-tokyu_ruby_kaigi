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

    def take(limit=10)
      meet_dates = []
      meet_date = Date.today.day < MEET_DAY ? next_meet_date(Date.today) : next_meet_date(1.month.past)

      loop do
        meet_dates << meet_date if meet_date.saturday? || meet_date.sunday? || holiday?(meet_date)
        return meet_dates if meet_dates.length == limit

        meet_date = next_meet_date(meet_date + 1.month)
      end
    end

    private
    def next_meet_date(date)
      date.change(day: MEET_DAY)
    rescue ArgumentError
      # there is not meet day in February
      date += 1.month
      retry
    end

    def holiday?(date)
      GoogleHolidayCalendar::Calendar.new(country: "japanese", lang: "ja").holiday?(date)
    end
  end
end
