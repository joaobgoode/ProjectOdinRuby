def stock_picker(days)
  res = [0,0]
  res_index = [0,0]
  days.each_with_index do |b, i|
    days[i+1..-1].each_with_index do |s,j|
      if res[1] - res[0] < s - b
        res = [b, s]
        res_index = [i, (j+i+1)]
      end
    end
  end
  res_index
end

p stock_picker([17,3,6,9,15,8,6,1,10])