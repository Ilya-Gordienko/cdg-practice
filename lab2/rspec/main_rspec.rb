require 'rspec'
require_relative 'main'

RSpec.describe "greetings" do
  it "correct for <18 years" do
    str = "Привет, Илья Гордиенко, тебе ментше 18 лет, но начать учиться программирвать никогда не рано!"
    [1,2,3,4,5,6,7,8,9,10].each do |value|
      RSpec.expect(greetings("Илья", "Гордиенко", value)).to eq str
    end
  end
  it "incorrect for >18 years do" do
    str = "Привет, Илья Гордиенко, тебе ментше 18 лет, но начать учиться программирвать никогда не рано!"
    [19,20,21,22,23,24,25].each do |value|
      RSpec.expect(greetings("Илья", "Гордиенко", value)).to eq str
    end
  end
end

RSpec.describe "foobar" do
  it "do incorrect for a=20 or b=20" do
    RSpec.expect(foobar(10,20)).to eq 40
  end
end
