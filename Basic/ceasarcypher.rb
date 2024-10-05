def caesar_cipher(text, num)
  temp = ""
  text.length.times do |i|
    char = text[i]
    if char.upcase != char.downcase
      offset = char == char.upcase ? 65 : 97
      charcode = (char.ord - offset + num) % 26 + offset
      temp += charcode.chr
    else
      temp += char
    end
  end
  temp
end