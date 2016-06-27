# Data Structures and Algorithms in Ruby
# 27th June 2016
# By Martin Nyaga

# Iterative Algorithms
# ====================
# ====================

# Largest Number
# ==============

# Algorithm description
# ---------------------
# - Loop through the array, keeping track of
#   the largest number so far in a variable, 
#   and return the number at the end

def largest_number arr
  largest_num = 0
  arr.each do |num|
    largest_num = num if num > largest_num
  end
  return largest_num
end

# Example
# -------
puts "Largest number iteratively:"
puts "List: " + (arr = [2,4,5,6,40,23,98,83]).to_s
puts "Largest number: " + largest_number([2,4,5,6,40,23,98,83]).to_s
puts

# Binary Search
# =============

# Algorithm description
# ---------------------
# - List must be sorted
# - Get the midpoint of the array, by setting the maximum index
#   to the last index of the array, and the minimum index to 0
# - If the number at the midpoint is higher than the target,
#   update the maximum to be midpoint - 1
# - If the number at the midpoint is lower than the target,
#   update the minimum to be midpoint + 1
# - If the number at the midpoint is the target, return the midpoint
#   as the index of the target number
# - If the minimum is ever greater than the maximum, the number is not
#   in the list

def binary_search arr, target
  max_index = arr.length - 1
  min_index = 0

  while(max_index >= min_index)
    midpoint = (max_index + min_index)/2
    if arr[midpoint] > target
      max_index = midpoint - 1
    elsif arr[midpoint] < target
      min_index = midpoint + 1
    elsif arr[midpoint] == target
      return midpoint
    end
  end

  return nil
end

# Example
# -------
puts "Binary search iteratively:"
puts "List: " + (arr = [1,2,3,4,5,6,7,8,9]).to_s
puts "Target: " + (target = 3).to_s
puts "Found at index: " + binary_search(arr, target).to_s
puts


# Recursive Algorithms
# ====================
# ====================

# Largest Number (recursive)
# ==============

# Algorithm description
# ---------------------
# - Divide the array into two parts, and compare the result of
#   largest_number_rec on the parts. Return the larger result
# - If the array length is <= 2, return the larger
#   of the two numbers (or the number itself)

def largest_number_rec arr
  # base case for odd number of items
  return arr[0] if arr.length == 1

  # base case for even number of items
  if arr.length == 2
    return arr[0] > arr[1] ? arr[0] : arr[1]
  end

  # split array into 2 and get largest number of each part
  midpoint = (arr.length - 1)/2
  num_1 = largest_number_rec(arr[0..midpoint])
  num_2 = largest_number_rec(arr[(midpoint + 1)..-1])

  return num_1 > num_2 ? num_1 : num_2
end

# Example
# -------
puts "Largest number recursively:"
puts "List: " + (arr = [2,4,5,6,40,23,98,83]).to_s
puts "Largest number: " + largest_number_rec([2,4,5,6,40,23,98,83]).to_s
puts


# Binary Search (recursive)
# =============

# Algorithm description
# ---------------------
# - List must be sorted
# - Get the midpoint of the array, using the provided maximum
#   and minimum indices
# - If the number at the midpoint is higher than the target,
#   call binary_search_rec on the lower half of the array
# - If the number at the midpoint is lower than the target,
#   call binary_search_rec on the higher half of the array
# - If the number at the midpoint is the target, return the midpoint
#   as the index of the target number
# - If the minimum is ever greater than the maximum, the number is not
#   in the list

def binary_search_rec arr, target, min_index = 0, max_index = arr.length - 1
  return nil if min_index > max_index

  midpoint = (max_index + min_index)/2

  if arr[midpoint] > target
    return binary_search_rec(arr, target, min_index, midpoint - 1)
  elsif arr[midpoint] < target
    return binary_search_rec(arr, target, midpoint + 1, max_index)
  elsif arr[midpoint] == target
    return midpoint
  end
end

# Example
# -------
puts "Binary search recursively:"
puts "List: " + (arr = [1,2,3,4,5,6,7,8,9]).to_s
puts "Target: " + (target = 3).to_s
puts "Found at index: " + binary_search_rec(arr, target).to_s
puts


# Sorting Algorithms
# ====================
# ====================

# Bubble Sort
# ===========

# Algorithm description
# ---------------------

# - Starting at index 0, set index_1 to 0, and index_2 to 1
# - Compare index_1 and index_2 and swap them if need be
# - increment index_1 and index_2 and repeat comparision and swapping
#   until index_2 is the last index in the array
# - After one swoop, the last item in the array is sorted. Set the
#   final index to the second last item, and repeat the swapping
#   process
# - if there is no swap in an iteration, then the list is sorted

def bubble_sort arr
  for i in (0..arr.length - 1)
    # start by selecting 0th and 1st items
    index_1 = 0
    index_2 = 1

    # set the index of the final item to stop loop
    index_final = (arr.length - 1) - i

    # var to check whether any swap occured
    swapped = false

    # loop through the array, until you reach the final index
    while index_2 <= index_final
      if arr[index_1] > arr[index_2]
        arr[index_2], arr[index_1] = arr[index_1], arr[index_2]
        swapped = true
      end

      # increment index 1 and index 2
      index_1 += 1
      index_2 += 1
    end

    # if no swap occured, the list is sorted
    return arr if !swapped
  end

  return arr
end

# Example
# -------
puts "Bubble Sort:"
print arr = (0..10).to_a.shuffle
puts
print bubble_sort(arr)
puts
puts


# Selection Sort
# =============

# Algorithm description
# ---------------------

# Swoop through the array and look for the smallest number
# Swap the smallest number with the number at index 0
# Repeat, and swap the second smallest number with the number
# at index 1
# Repeat until you have reached the end of the array

def selection_sort arr
  # var to store the current index
  current_index = 0

  # loop until the end of the array
  while current_index < arr.length

    # assume current number is smallest
    smallest_number_index = current_index

    # loop the array to the right of the number
    for i in ((current_index + 1)..(arr.length - 1))
      # keep track of the smallest number so far
      smallest_number_index = i if arr[i] < arr[smallest_number_index]
    end

    # swap smallest number with current index
    arr[current_index], arr[smallest_number_index] = arr[smallest_number_index], arr[current_index]

    # increment current index
    current_index += 1
  end

  return arr
end

# Example
# -------
puts "Selection Sort:"
print arr = (0..10).to_a.shuffle
puts
print selection_sort(arr)
puts
puts


# Merge Sort
# ==========

# Algorithm description
# ---------------------

# - if list length is 1, return the list
# - Split the array into two
# - sort the left half of the array (recursively)
# - sort the right half of the array (recursively)
# - Put them back in the correct order

def merge_sort arr
  # base case
  return arr if arr.length == 1

  # split array and sort the halves
  midpoint = (arr.length - 1)/2
  arr_1 = merge_sort(arr[0..midpoint])
  arr_2 = merge_sort(arr[(midpoint + 1)..(arr.length - 1)])

  # put halves back together in the correct order
  return merge(arr_1, arr_2)
end

def merge arr_1, arr_2
  # arr to hold merged array
  arr = []

  # repeatedly compare the lowest elements in the
  # sub arrays and merge them into arr
  while arr_1[0] && arr_2[0]
    if arr_1[0] < arr_2[0]
      arr << arr_1.shift
    else
      arr << arr_2.shift
    end
  end

  # merge the remaining parts of the arrays if elements
  # are still present
  arr.push(arr_1).flatten! if arr_1[0]
  arr.push(arr_2).flatten! if arr_2[0]
  
  return arr
end

# Example
# -------
puts "Merge Sort:"
print arr = (0..10).to_a.shuffle
puts
print merge_sort(arr)
puts
puts



# Data Structures
# ====================
# ====================

# Queue
# =====

# Can be implemented as an array in ruby
# Make use of Array#push and Array#shift

def queue_as_array
  puts "Queue as array: "
  arr = [1,3,4,5,6,7]
  print arr
  puts

  puts "Dequeue element (1) from head:"
  puts arr.shift
  print arr
  puts

  puts "Enqueue element (8) at tail:"
  arr.push(8)
  print arr
  puts

  puts "Head:"
  puts arr[0]
  puts "Tail:"
  puts arr[-1]
  puts
end

# Example
# -------
queue_as_array

# Simple Queue Class
# ==================

class Queue
  attr_accessor :arr

  def initialize arr = []
    @arr = arr
  end

  def enqueue num
    @arr << num
  end

  def dequeue
    @arr.shift
  end

  def empty?
    @arr.empty?
  end

  def head
    @arr[0]
  end

  def tail
    @arr[-1]
  end

  def to_s
    @arr.to_s
  end

  def clear!
    @arr = []
  end
end

def queue_as_class
  puts "Queue as class: "
  queue = Queue.new([1,3,4,5,6,7])
  print queue.to_s
  puts

  puts "Dequeue element (1) from head:"
  puts queue.dequeue
  print queue.to_s
  puts

  puts "Enqueue element (8) at tail:"
  queue.enqueue(8)
  print queue.to_s
  puts

  puts "Head:"
  puts queue.head
  puts "Tail:"
  puts queue.tail
  puts
end

# Example
# -------
queue_as_class

# Stack
# =====

# Can also be implemented as an array in ruby
# Make use of Array#push and Array#pop

def stack_as_array
  puts "Stack as array: "
  arr = [1,3,4,5,6,7]
  print arr
  puts

  puts "Pop top element (7):"
  puts arr.pop
  print arr
  puts

  puts "Push element (8):"
  arr.push(8)
  print arr
  puts
  puts
end

# Example
# -------
stack_as_array

# Linked List
# ===========

# Linked List, ruby's missing data structure
# https://www.sitepoint.com/rubys-missing-data-structure/

# Key points
# ----------
# Array#unshift
# Ruby's memory allocation for arrays
# Ruby's copy on write optimization

# Graph
# =====
# e.g. Social media connections graph:
# (1) John Doe --------- (5) Mary Jane
#   |   \
#   |    \
#   |   (2) Martin Nyaga
#   |          \ 
#   |           \        
#   |            \                     
#   |             \
# (3) Jane Doe --- (4) Peter Dane

# Represented as an edge list
# i.e. List of arrays representing connections between vertices 
graph_edge_list = 
[
  [1,5],
  [1,2],
  [1,3],
  [3,4],
  [2,4]
]

# Represented as an adjacency matrix
# i.e. matrix with 1s in positions showing adjacent vertices
graph_adjacency_matrix = 
[
  [0, 1, 1, 0, 1],
  [1, 0, 0, 1, 0],
  [1, 0, 0, 1, 0],
  [0, 1, 1, 0, 0],
  [1, 0, 0, 0, 0]
]

# Represented as Adjacency list
# i.e. list of all vertices, each with a list of its adjacent vertices
graph_adjacency_list = 
{
  1 => [2, 3, 5],
  2 => [1, 4],
  3 => [1, 4],
  4 => [2, 3],
  5 => [1]
}

# - Graph class that takes in a list of edges and 
#   builds an  internal adjacency list
# - Supports adding and removing edges
# - Uses a breadth first search to find the shortest path between elements
#   shortest path algorithm
# - Still could use a lot of optimisations, and does not cover a lot of the more
#   complicated things that graphs can be used for, but this works as a fundamental representation


# See Khan Academy Algorithms Course for full explanation and implementation in javascript
# https://www.khanacademy.org/computing/computer-science/algorithms/

class Graph
  attr_accessor :adjacency_list
  
  def initialize edges
    @adjacency_list = {}

    edges.each do |edge|
      add_edge edge
    end
  end

  def add_edge edge
    @adjacency_list[edge[0]] ||= []
    @adjacency_list[edge[0]].push(edge[1])

    @adjacency_list[edge[1]] ||= []
    @adjacency_list[edge[1]].push(edge[0])
  end

  def remove_edge edge
    @adjacency_list[edge[0]] ||= []
    @adjacency_list[edge[0]].delete(edge[1])

    @adjacency_list[edge[1]] ||= []
    @adjacency_list[edge[1]].delete(edge[0])
  end

  def shortest_path_between source, target
    bfs_info = perform_bfs(source)
    current_target = target
    path = [target]

    while bfs_info[target][:predecessor] != source
      return [] if bfs_info[target][:predecessor] == nil
      path.push bfs_info[target][:predecessor]
      target = bfs_info[target][:predecessor]
    end

    path.push source
    return path.reverse.join(" -> ")
  end

  def perform_bfs source
    bfs_info = {}

    @adjacency_list.each do |k, v|
      bfs_info[k] = { distance: nil, predecessor: nil }
    end

    bfs_info[source][:distance] = 0
    
    queue = Queue.new
    queue.enqueue source

    while !queue.empty?
      current_item = queue.dequeue
  
      @adjacency_list[current_item].each do |item|
        next if bfs_info[item][:distance] != nil
        bfs_info[item][:predecessor] = current_item
        bfs_info[item][:distance] = bfs_info[current_item][:distance] + 1
        queue.enqueue item
      end
    end

    return bfs_info
  end

end


# Example
# -------

puts "Graph represented as edge list:"
print graph_edge_list
puts

puts "Graph represented as adjacency list:"
graph = Graph.new(graph_edge_list)
puts graph.adjacency_list

puts "Add edge 3-2:"
graph.add_edge([3,2])
puts graph.adjacency_list

puts "Remove edge 3-2:"
graph.remove_edge([3,2])
puts graph.adjacency_list

puts "Shortest path between 4 and 5:"
puts graph.shortest_path_between(4,5)

puts "Shortest path between 2 and 3:"
puts graph.shortest_path_between(2,3)

# References
# ==========

# Five Reasons Why I Learn in Public
# https://medium.com/techspiration-ideas-making-it-happen/5-reasons-why-i-learn-in-public-160a99f2d822#.qhtxe01ne

# The Bastard's Book of Ruby
# http://ruby.bastardsbook.com/

# Linked List, ruby's missing data structure
# https://www.sitepoint.com/ruby's-missing-data-structure/

# Khan Academy Algorithms Course
# https://www.khanacademy.org/computing/computer-science/algorithms/

# The Odin Project Ruby Course
# http://www.theodinproject.com/ruby-programming#section-a-bit-of-computer-science


# Example Runs
# ============

# >> Largest number iteratively:
# >> List: [2, 4, 5, 6, 40, 23, 98, 83]
# >> Largest number: 98
# >> 
# >> Binary search iteratively:
# >> List: [1, 2, 3, 4, 5, 6, 7, 8, 9]
# >> Target: 3
# >> Found at index: 2
# >> 
# >> Largest number recursively:
# >> List: [2, 4, 5, 6, 40, 23, 98, 83]
# >> Largest number: 98
# >> 
# >> Binary search recursively:
# >> List: [1, 2, 3, 4, 5, 6, 7, 8, 9]
# >> Target: 3
# >> Found at index: 2
# >> 
# >> Bubble Sort:
# >> [6, 3, 1, 7, 8, 2, 10, 0, 4, 9, 5]
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# >> 
# >> Selection Sort:
# >> [7, 0, 5, 1, 8, 6, 2, 9, 10, 4, 3]
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# >> 
# >> Merge Sort:
# >> [5, 2, 0, 9, 4, 6, 1, 8, 3, 7, 10]
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# >> 
# >> Queue as array: 
# >> [1, 3, 4, 5, 6, 7]
# >> Dequeue element (1) from head:
# >> 1
# >> [3, 4, 5, 6, 7]
# >> Enqueue element (8) at tail:
# >> [3, 4, 5, 6, 7, 8]
# >> Head:
# >> 3
# >> Tail:
# >> 8
# >> 
# >> Queue as class: 
# >> [1, 3, 4, 5, 6, 7]
# >> Dequeue element (1) from head:
# >> 1
# >> [3, 4, 5, 6, 7]
# >> Enqueue element (8) at tail:
# >> [3, 4, 5, 6, 7, 8]
# >> Head:
# >> 3
# >> Tail:
# >> 8
# >> 
# >> Stack as array: 
# >> [1, 3, 4, 5, 6, 7]
# >> Pop top element (7):
# >> 7
# >> [1, 3, 4, 5, 6]
# >> Push element (8):
# >> [1, 3, 4, 5, 6, 8]
# >> 
# >> Graph represented as edge list:
# >> [[1, 5], [1, 2], [1, 3], [3, 4], [2, 4]]
# >> Graph represented as adjacency list:
# >> {1=>[5, 2, 3], 5=>[1], 2=>[1, 4], 3=>[1, 4], 4=>[3, 2]}
# >> Add edge 3-2:
# >> {1=>[5, 2, 3], 5=>[1], 2=>[1, 4, 3], 3=>[1, 4, 2], 4=>[3, 2]}
# >> Remove edge 3-2:
# >> {1=>[5, 2, 3], 5=>[1], 2=>[1, 4], 3=>[1, 4], 4=>[3, 2]}
# >> Shortest path between 4 and 5:
# >> 4 -> 3 -> 1 -> 5
# >> Shortest path between 2 and 3:
# >> 2 -> 1 -> 3