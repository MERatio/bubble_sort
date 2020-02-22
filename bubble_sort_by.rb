def bubble_sort_by(arr)
  arr_copy = Marshal.load(Marshal.dump(arr))
  is_sorted = false

  until (is_sorted)
    is_swapped = false

    for i in (0..arr.length - 1)
      # To not get the last element (the last element can't be compare to any element)
      if (i <= arr.length - 2)
        left = arr_copy[i]
        right = arr_copy[i + 1]

        if yield(left, right) > 0
          arr_copy[i], arr_copy[i + 1] = right, left
          is_swapped = true
        end
      end
    end

    # The array is sorted if there is no swapped element (in this iteration)
    is_sorted = true if is_swapped == false
  end
  
  arr_copy
end

unsorted_input = ["hi","hello","hey"]

sorted_input = bubble_sort_by(unsorted_input) do |left,right|
  left.length - right.length
end

p sorted_input