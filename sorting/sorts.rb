require 'pry'


# create a randomly sized array (1-10 elements) with random values (0-999)
def create_array
	array = []
	rand_size = rand(10) + 1
	(0..rand_size).each do
		array.push( rand(1000) )
	end
	return array
end

# TODO: write insertion sort
# https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html
# start with the second value in the array
# compare it with the value to its left
# if the value on the left is larger, swap
# move on to the next place of the array
# compare it with the value to its left, keep comparing and try to swap
# stop moving to the left when you find a pair that is in order
def insertion_sort(arr)
	return arr
end

# This method returns the index of the smallest value to the right of the given index
# Can also use ruby's min method but I'm assuming we're not allowed to use built-in methods
def find_smallest_to_the_right(arr, index)
	min_val = arr[index]
	min_index = index
	(arr.length - index).times  do |n|
		real_index = n + index
		if arr[real_index] < min_val
			min_val = arr[real_index]
			min_index = real_index
		end
	end
	return min_index
end

def swap(arr, i, j)
	arr[i], arr[j] = arr[j], arr[i]
	return arr
end

# go through the entire array and find the smallest value
# swap the smallest value with the first place (or whatever place you are on)
# continue this throughout the array
def selection_sort(arr)
	arr.length.times do |current_place|
		# Find the index of the smallest value to the right of the current place
		min_index = find_smallest_to_the_right(arr, current_place)
		# Swap the min value with the current place in the array
		swap(arr, min_index, current_place)
	end
	return arr
end

begin
	numbers = create_array()
	sorted_numbers = numbers.dup.sort!
	puts "Generating an array that's not sorted..."
end while numbers == sorted_numbers

puts "original array = "
print numbers
puts "\n\n"

puts "after RUBY SORT, array = "
print sorted_numbers
puts "\n\n"

puts "after SELECTION SORT, array = "
selection_numbers = selection_sort(numbers.dup)
print selection_numbers
raise "Selection Sort doesn't sort!" unless selection_numbers == sorted_numbers
puts "\n\n"

puts "after INSERTION SORT, array = "
insertion_numbers = insertion_sort(numbers.dup)
print insertion_numbers
raise "Insertion Sort doesn't sort!" unless insertion_numbers == sorted_numbers
puts "\n\n"

puts "YAY!! I wrote Insertion sort and Selection sort in Ruby!! Aren't I awesome?"