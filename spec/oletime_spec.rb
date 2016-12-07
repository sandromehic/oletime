require "spec_helper"

describe Oletime do
  before(:example) do
    @time = Oletime::Time.new(2016,10,25,12,51,34.123,"+00:00")
    @real_time = Time.new(2016,10,25,12,51,34.123,"+00:00")
    @unix_time = 1477399894.123
    @ole_time = 42668.535811609
    @ole_time_ms = 42668.535811608795
  end

  it "has a version number" do
    expect(Oletime::VERSION).not_to be nil
  end

  it "instantites correctly current time" do
    expect(@time.time).to eq(@real_time)
  end

  it "creates from OLE time correctly" do
    t = Oletime::Time.from_ole(@ole_time)
    expect(t.time.to_f).to be_within(0.001).of(@real_time.to_f)
  end

  it "creates from OLE time in ms correctly" do
    t = Oletime::Time.from_ole(@ole_time_ms)
    expect(t.time.to_f).to be_within(0.000001).of(@real_time.to_f)
  end

  it "converts time to OLE format" do
    expect(@time.to_ole).to be_within(0.001).of(@ole_time)
    expect(@time.to_ole).to be_within(0.000001).of(@ole_time_ms)
  end
end
