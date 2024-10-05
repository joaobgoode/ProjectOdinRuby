def substrings (text, dict)
  res = {}
  dict.each do |word|
    qtd = (text.length - text.downcase.gsub(word.downcase,"").length) / word.length
    if qtd > 0
      res[word] = qtd
    end
  end
  res
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)