class Encryption

  def initialize(file)
    @file = file
    @seed_number = File.open(file, &:readline).to_i
    @rotated_lower_case_alphabets = ("a".."z").to_a.rotate(@seed_number)
    @rotated_upper_case_alphabets = ("A".."Z").to_a.rotate(@seed_number)
  end

  def encrypt(string)
    string.chars.map { |char| encrypt_char(char) }.join
  end

  def encrypt_file
    File.open(@file).each do |line|
      new_encrypt = line.chars.map { |char| encrypt_char(char) }.join
      print new_encrypt
    end
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

encryption = Encryption.new("encryption.txt")
encryption.encrypt_file
