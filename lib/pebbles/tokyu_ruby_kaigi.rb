require "pebbles/tokyu_ruby_kaigi/version"

module Pebbles
  module TokyuRubyKaigi
    require "active_support/all"
    require "holiday_japan"

    MEET_DAY = 29

    # find next target day of TokyuRubyKaigi
    # @return [Date]
    def self.find
      take(1).first
    end

    # take target days of TokyuRubyKaigi
    # @param limit
    # @return [Array<Date>]
    def self.take(limit=10)
      tokyu_ruby_kaigi_dates = []
      meet_date = Date.today.day < MEET_DAY ? next_meet_date(Date.today) : next_meet_date(1.month.past)

      loop do
        tokyu_ruby_kaigi_dates << meet_date if meet_date.saturday? || meet_date.sunday? || holiday?(meet_date)
        return tokyu_ruby_kaigi_dates if tokyu_ruby_kaigi_dates.length == limit

        meet_date = next_meet_date(meet_date + 1.month)
      end
    end

    private
    def self.next_meet_date(date)
      date.change(day: MEET_DAY)
    rescue ArgumentError
      # there is not meet day in February
      date += 1.month
      retry
    end

    def self.holiday?(date)
      date.national_holiday?
    end
  end
end
