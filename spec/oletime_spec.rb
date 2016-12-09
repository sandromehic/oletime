require 'spec_helper'

describe Oletime do
  let(:oletime) { Oletime::Time.new(2016, 10, 25, 12, 51, 34.123, '+00:00') }
  let(:real_time) { Time.new(2016, 10, 25, 12, 51, 34.123, '+00:00') }
  let(:unix_time) { 147_739_989_4.123 }
  let(:ole_time_float) { 426_68.535811609 }
  let(:ole_time_ms) { 426_68.535811608795 }

  it 'has a version number' do
    expect(Oletime::VERSION).not_to be nil
  end

  it 'instantites correctly current time' do
    expect(oletime.time).to eq(real_time)
  end

  it 'creates from OLE time correctly' do
    t = Oletime::Time.from_ole(ole_time_float)
    expect(t.time.to_f).to be_within(0.001).of(real_time.to_f)
  end

  it 'creates from OLE time in ms correctly' do
    t = Oletime::Time.from_ole(ole_time_ms)
    expect(t.time.to_f).to be_within(0.000001).of(real_time.to_f)
  end

  it 'converts time to OLE format' do
    expect(oletime.to_ole).to be_within(0.001).of(ole_time_float)
    expect(oletime.to_ole).to be_within(0.000001).of(ole_time_ms)
  end
end
