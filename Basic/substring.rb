def substrings (text, dict)
  res = {}
  dict.each do |word|
    qtd = 0
    index = 0
    loop do
      if word.upcase == text[index..(index + word.length-1)].upcase
        qtd += 1
      end
      index += 1
      if index + word.length == text.length
        break
      end
    end

    if qtd > 0
      res[word] = qtd
    end
  end
  res
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)