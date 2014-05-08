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

  it "encrypts 'Hello World!' to 'Uryyb Jbeyq!'" do
    encryption = Encryption.new

    encryption.encrypt("Hello World!").should == 'Uryyb Jbeyq!'
  end

  it "given a magic number '1' encrptys 'a' and returns 'b'" do
    encryption = Encryption.new(1)

    encryption.encrypt("a").should == "b"
  end

  it "should receive a file and encrypt it" do
    file_content = <<EOF
I just want to encrypt this somethings
And some more things
EOF
    encrypted_content = <<EOF
J kvtu xbou up fodszqu uijt tpnfuijoht
Boe tpnf npsf uijoht
EOF
    File.open("file.txt", "w") { |f| f.puts(file_content) }
    encryption = Encryption.new(1)
    encrypted_file = encryption.encyrpt_file("file.txt")

    File.exist?(encrypted_file).should be_true
    File.read(encrypted_file).should eq(encrypted_content)
    File.delete("file.txt")
    File.delete(encrypted_file)
  end

end
