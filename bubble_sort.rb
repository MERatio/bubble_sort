def bubble_sort(arr)
  arr_copy = Marshal.load(Marshal.dump(arr))
  is_sorted = false

  until (is_sorted)
    is_swapped = false

    for i in (0..arr.length - 1)
      # To not get the last element (the last element can't be compare to any element)
      if (i <= arr_copy.length - 2)
        if (arr_copy[i] > arr_copy[i + 1])
          arr_copy[i], arr_copy[i + 1] = arr_copy[i + 1], arr_copy[i]
          is_swapped = true
        end
      end
    end

    # The array is sorted if there is no swapped element (in this iteration)
    is_sorted = true if is_swapped == false
  end
  
  arr_copy
end

unsorted_numbers = [4,3,78,2,0,2]
sorted_numbers = bubble_sort(unsorted_numbers)

p sorted_numbers