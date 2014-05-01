class Encryption

  def encrypt(string)
    string.chars.map { |char| encrypt_char(char) }.join
  end

  def encrypt_char(char)
    if char.match(/[A-Z]/)
      ("A".."Z").to_a.rotate(13)[char.ord - "A".ord]
    elsif char.match(/[a-z]/)
      ("a".."z").to_a.rotate(13)[char.ord - "a".ord]
    else
      char
    end
  end

end
