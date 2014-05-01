require "spec_helper"

describe Encryption do

  it "encrypts returns a String" do
    encryption = Encryption.new

    encryption.encrypt('a').should be_a String
  end
end
