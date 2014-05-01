class Encryption

  def encrypt(string)
    ("a".."z").to_a.rotate(13)[string.ord - "a".ord]
  end

end
