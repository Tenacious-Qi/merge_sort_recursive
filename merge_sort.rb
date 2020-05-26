# frozen_string_literal: true

def merge_sort(array)
  return array if array.size < 2

  # sort left-half
  left = merge_sort(array[0...(array.size / 2)])
  # sort right-half
  right = merge_sort(array[(array.size / 2)...array.size])
  # merge them together
  merge(left, right, [])
end

def merge(left, right, result, index_left = 0, index_right = 0)
  while index_left < left.size && index_right < right.size
    # if item on left is smaller, append it to result
    if left[index_left] < right[index_right]
      result << left[index_left]
      index_left += 1
    # if item on right is smaller, append it to result
    else
      result << right[index_right]
      index_right += 1
    end
  end
  # copy remaining elements from opposite array into result
  concat_remaining(result, left, right, index_left, index_right)
end

def concat_remaining(result, left, right, index_left, index_right)
  # if end of left reached first, concat remaining elements of right
  if index_left == left.size
    result.concat(right[index_right...right.size])
  # if end of right reached first, concat remaining elements of left
  else
    result.concat(left[index_left...left.size])
  end
end

p merge_sort([4, 8, 6, 2, 1, 7, 5, 3])
