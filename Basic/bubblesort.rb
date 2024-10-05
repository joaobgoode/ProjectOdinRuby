def bubble_sort(array)
  top = array.length-1
  while top != 1
    top.times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
      end
    end
    top -= 1
  end
  array
end

p bubble_sort([4,3,78,2,0,2])