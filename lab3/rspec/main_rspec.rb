require 'rspec'
require_relative 'main'

RSpec.describe "task1" do
  it "correct for last symbols = CS" do
    str = "ABCDCS"
      RSpec.expect(task1(str)).to eq 2 ** str.length
  end
  it  "correct for last symbols != CS" do
    str = "ABCDEF"
      RSpec.expect(task1(str)).to eq str.reverse
  end
end
