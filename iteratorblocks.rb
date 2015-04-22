#Exercise 1 - Each Method

#define each w/ parameter arr
def each(arr)
	i = 0
	#put in a while loop to iterate through the array 
	while i < arr.length
		yield (arr[i])
		#have to increment the array or it will just run forever 
		i += 1
	end 
end 

each([1,2,3]) do |x|
	puts x * x
end 

#Exercise 2 - Map Method 

# so we define the map and input the array
def map(arr)
	#empty array to store the result in 
  result_array = []
  	#each time does the value of x
  	each do |x|
  	#result of the array is yielded to x 
 	 result.array << yield(x)
  end
end


arr = map([1,2,3]) do |x|
  x * x
end

p arr # => [1,4,9]

#solution

def map(arr)
  result = []
  each(arr) do |x|
    result << yield(x)
  end
  result
end

arr = map([1,2,3]) do |x|
  x * x
end


#Exercise 3 - Method Reduce 

#defining reduce with inputs array and acc
def reduce(arr,acc)
  #empty array 
  array = []
  #reducing the array with an initial value of 0 then the two parameters num and sum continues
  #through the loop until the values reach 0
  array.reduce(0) {|sum, num| sum + num * 2}
end

sum = reduce([1,2,3,4,5], 0) do |memo,val|
  memo + val
end

puts sum # => 15

#solution

p arr

def reduce(arr, acc)
#so each array does x
  each(arr) do |x|
  	#acc is yielded with parameters acc and x
    acc = yield(acc,x)
  end
  #puts up acc
  acc
end

sum = reduce([1,2,3,4,5], 0) do |memo,val|
  memo + val
end

puts sum

#Exercise 4 - Method Filter 

#basically same thing as exercise 2 but using the filter to call is the main difference 
def filter(arr)
	result = []
	each(arr) do |x|
		result << yield(x)
	end
end

filt = filter([1,2,3,4,5,6,7,8]) do |x|
  x.even?
end

p filt # => [2,4,6,8]

#solution

def filter(arr)
  result = []
  each(arr) do |x|
    result << x if yield(x)
  end
  result
end

filt = filter([1,2,3,4,5,6,7,8]) do |x|
  x.even?
end

p filt