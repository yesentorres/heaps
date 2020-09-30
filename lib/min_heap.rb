class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    if @store.empty?
      return nil
    end
  
    swap(0, @store.length - 1)
    removed = @store.pop
  
    heap_down(0) unless @store.empty?

    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    return if index == 0

    parent = (index - 1) / 2
    
    # swap if node is less than it's parent node
    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2

    if right_child < @store.length
      if @store[left_child].key > @store[right_child].key
        smaller_child = right_child
      else
        smaller_child = left_child
      end

      if @store[index].key > @store[smaller_child].key
        swap(index, smaller_child)
        heap_down(smaller_child)
      end

    elsif left_child < @store.length
      if @store[index].key > @store[left_child].key
        swap(index, left_child)
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end