require 'oletime/version'

module Oletime
  # Holds `time` value and converts to and from ole float value
  class Time
    attr_accessor :time
    def initialize(year, month = nil, day = nil, hour = nil, minute = nil,
                   second = nil, utc_offset = nil)
      @time = ::Time.new(year, month, day, hour, minute, second, utc_offset)
    end

    def self.from_ole(value)
      new(::Time.now.year).tap do |t|
        t.time = ::Time.at((value - 255_69) * 864_00).utc
      end
    end

    def to_ole
      (@time.to_f / 864_00) + 255_69
    end

    def to_s
      @time.to_s
    end
  end
end
