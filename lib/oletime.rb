require "oletime/version"

module Oletime
  class Time
    attr_accessor :time
    def initialize(year, month=nil, day=nil, hour=nil, minute=nil, second=nil, utc_offset=nil)
      @time = ::Time.new(year, month, day, hour, minute, second, utc_offset)
    end

    def self.from_ole(value)
      self.new(::Time.now.year).tap do |t|
        t.time = ::Time.at((value - 25569) * 86400).utc
      end
    end

    def to_ole
      (@time.to_f / 86400) + 25569
    end
  end
end
