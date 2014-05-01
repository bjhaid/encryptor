class Encryption

  def encrypt(string)
    if string.match(/[A-Z]/)
      ("A".."Z").to_a.rotate(13)[string.ord - "A".ord]
    else
      ("a".."z").to_a.rotate(13)[string.ord - "a".ord]
    end
  end

end
