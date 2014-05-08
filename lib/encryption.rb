class Encryption

  def initialize(seed_number = 13)
    @rotated_lower_case_alphabets = ("a".."z").to_a.rotate(seed_number)
    @rotated_upper_case_alphabets = ("A".."Z").to_a.rotate(seed_number)
  end

  def encrypt_from_file(filename, output_filename = "encrypted.txt")
    data = FileParser.read_file(filename)
    output = encrypt(data)
    FileParser.write_file(output_filename, output)
  end

  def encrypt(string)
    string.chars.map { |char| encrypt_char(char) }.join
  end

  def encrypt_char(char)
    if char.match(/[A-Z]/)
      @rotated_upper_case_alphabets[char.ord - "A".ord]
    elsif char.match(/[a-z]/)
      @rotated_lower_case_alphabets[char.ord - "a".ord]
    else
      char
    end
  end
end



module FileParser

  def self.read_file(filename)
    if File.exists? filename 
      file = File.open(filename, 'r')
      data = file.read
      file.close
      data
    else
      puts "file doesn't exist"
    end
  end

  def self.write_file(filename, text)
    File.open(filename, 'w'){ |f| f.write(text) }
  end
end

# p FileParser.read_file "hello_world.txt"
# data = FileParser.read_file "hello_world.txt"
encryptor = Encryption.new
text = encryptor.encrypt_from_file("hello_world.txt")
# p FileParser.write_file("secret_text.txt", "Hello, how are you?")



# def self.write_file(filename, text)
    # if File.exists?(filename)
      # puts "File already exist. Do you want to overwrite?(y/n)"
      # answer = gets.chomp
      # if answer == "y" || "Y"
        # File.open(filename, 'w'){ |f| f.write(text) }
      # else
        # puts "Enter filename"
        # name = gets.chomp
        # File.open(gets.chomp, 'w'){ |f| f.write(text) }
      # end
    # end
  # end
# end
