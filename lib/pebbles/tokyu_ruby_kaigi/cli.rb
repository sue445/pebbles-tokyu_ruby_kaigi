require 'pebbles/tokyu_ruby_kaigi'
require 'thor'

module Pebbles
  module TokyuRubyKaigi
    class CLI < Thor
      desc "next", "show next target day of TokyuRubyKaigi"
      def next
        date = Pebbles::TokyuRubyKaigi.find
        puts "#{date.strftime("%Y/%m/%d(%a)")}"
      end

      desc "take LIMIT", "show target days of TokyuRubyKaigi (default 10 days)"
      def take(limit=10)
        dates = Pebbles::TokyuRubyKaigi.take(limit)
        dates.each do |date|
          puts "#{date.strftime("%Y/%m/%d(%a)")}"
        end
      end
    end
  end
end
