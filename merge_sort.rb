# frozen_string_literal: true

def merge_sort(array)
  return array if array.size < 2

  left = array[0...(array.size / 2)]
  right = array[(array.size / 2)...array.size]
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right, [])
end

def merge(left, right, result, index_left = 0, index_right = 0)
  while index_left < left.size && index_right < right.size
    if left[index_left] < right[index_right]
      result << left[index_left]
      index_left += 1
    else
      result << right[index_right]
      index_right += 1
    end
  end
  concat_remaining(result, left, right, index_left, index_right)
end

def concat_remaining(result, left, right, index_left, index_right)
  if index_left == left.size
    result.concat(right[index_right...right.size])
  else
    result.concat(left[index_left...left.size])
  end
end

p merge_sort([4, 8, 6, 2, 1, 7, 5, 3])
