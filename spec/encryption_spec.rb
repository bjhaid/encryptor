require "spec_helper"

describe Encryption do

  let(:encryption) { Encryption.new }

  it "encrypts returns a String" do
    encryption.encrypt('a').should be_a String
  end

  it "encrypts 'm' and returns 'z'" do
    encryption.encrypt('m').should == 'z'
  end

  it "encrypts 'z' and returns 'm'" do
    encryption.encrypt('z').should == 'm'
  end

  it "encrypts 'Z' and returns 'M'" do
    encryption.encrypt('Z').should == 'M'
  end

  it "encrypts 'Z' and returns 'M'" do
    encryption.encrypt('Z').should == 'M'
  end

  it "does not encrypt special characters" do
    encryption.encrypt(',').should == ','
  end

  it "encrypts 'Hello World!' to 'Uryyb Jbeyq!'" do
    encryption.encrypt("Hello World!").should == 'Uryyb Jbeyq!'
  end


end
