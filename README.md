# Pebbles::TokyuRubyKaigi [![Gem Version](https://badge.fury.io/rb/pebbles-tokyu_ruby_kaigi.png)](http://badge.fury.io/rb/pebbles-tokyu_ruby_kaigi) [![Build Status](https://travis-ci.org/sue445/pebbles-tokyu_ruby_kaigi.png)](https://travis-ci.org/sue445/pebbles-tokyu_ruby_kaigi) [![Coverage Status](https://coveralls.io/repos/sue445/pebbles-tokyu_ruby_kaigi/badge.png)](https://coveralls.io/r/sue445/pebbles-tokyu_ruby_kaigi)

Find target day of TokyuRubyKaigi (http://qwik.jp/tokyurb/)

## Definition of TokyuRubyKaigi

* 29th day a.k.a Meet day (肉の日)
* Holiday (Saturday, Sunday or National holiday)

## Installation

Add this line to your application's Gemfile:

    gem 'pebbles-tokyu_ruby_kaigi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pebbles-tokyu_ruby_kaigi

## Usage

```sh
$ tokyu_ruby_kaigi next
2014/03/29(Sat)

$ tokyu_ruby_kaigi take
2014/03/29(Sat)
2014/04/29(Tue)
2014/06/29(Sun)
2014/11/29(Sat)
2015/03/29(Sun)
2015/04/29(Wed)
2015/08/29(Sat)
2015/11/29(Sun)
2016/04/29(Fri)
2016/05/29(Sun)
```

## Contributing

1. Fork it ( https://github.com/sue445/pebbles-tokyu_ruby_kaigi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
