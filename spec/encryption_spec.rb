require "spec_helper"

describe Encryption do

  it "encrypts returns a String" do
    encryption = Encryption.new

    encryption.encrypt('a').should be_a String
  end

  it "encrypts 'm' and returns 'z'" do
    encryption = Encryption.new

    encryption.encrypt('m').should == 'z'
  end

  it "encrypts 'z' and returns 'm'" do
    encryption = Encryption.new

    encryption.encrypt('z').should == 'm'
  end

  it "encrypts 'Z' and returns 'M'" do
    encryption = Encryption.new

    encryption.encrypt('Z').should == 'M'
  end

  it "encrypts 'Z' and returns 'M'" do
    encryption = Encryption.new

    encryption.encrypt('Z').should == 'M'
  end

  it "does not encrypt special characters" do
    encryption = Encryption.new

    encryption.encrypt(',').should == ','
  end
end
