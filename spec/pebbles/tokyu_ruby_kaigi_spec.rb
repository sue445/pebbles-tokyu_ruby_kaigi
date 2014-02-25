require 'spec_helper'

describe Pebbles::TokyuRubyKaigi do
  it 'should have a version number' do
    expect(Pebbles::TokyuRubyKaigi::VERSION).not_to be nil
  end

  describe "#find" do
    include Pebbles::TokyuRubyKaigi

    subject{ find }

    context "on Saturday" do
      before do
        time_travel_to "2014-01-01"
      end

      it{ should == date("2014-03-29") }
    end

    context "on Sunday" do
      before do
        time_travel_to "2012-07-01"
      end

      it{ should == date("2012-07-29") }
    end

    context "on Holiday" do
      before do
        time_travel_to "2014-04-01"
      end

      it{ should == date("2014-04-29") }
    end
  end

  describe "#take" do
    include Pebbles::TokyuRubyKaigi

    subject{ take(limit) }

    let(:limit){ 3 }

    before do
      time_travel_to "2014-03-01"
    end

    its(:count){ should == limit }
    its([0]){ should == date("2014-03-29") }
    its([1]){ should == date("2014-04-29") }
    its([2]){ should == date("2014-06-29") }
  end

  def date(str)
    Date.parse(str)
  end
end
