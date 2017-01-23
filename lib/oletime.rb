require 'oletime/version'

module Oletime
  # Holds `time` value and converts to and from ole float value
  class Time
    attr_accessor :time
    def initialize(year = nil, month = nil, day = nil, hour = nil, minute = nil,
                   second = nil, utc_offset = nil)
      if year
        @time = ::Time.new(year, month, day, hour, minute, second, utc_offset)
      else
        @time = ::Time.new.utc
      end
    end

    def self.from_ole(value)
      new(::Time.now.year).tap do |t|
        t.time = ::Time.at((value - 25_569) * 86_400).utc
      end
    end

    def to_ole
      (@time.to_f / 86_400) + 25_569
    end

    def to_s
      @time.to_s
    end
  end
end
