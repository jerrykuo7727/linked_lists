require './node.rb'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(val)
    new_node = Node.new(val)
    if @head == nil
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(val)
    new_node = Node.new(val)
    if @head == nil
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    curr = @head
    count = 0
    until curr == nil do
      curr = curr.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    unless index < size
      puts "Error: Index out of boundary!"
      return nil
    end

    curr = @head
    1.upto(index) do
      curr = curr.next_node
    end
    curr
  end

  def pop
    if @head == nil
      puts "Error: Linked list is empty!"
      return nil
    elsif @head == @tail
      pop_node = @head
      @head = nil
      @tail = nil
      return pop_node
    else
      prev = @head
      until prev.next_node == @tail
        prev = prev.next_node
      end
      pop_node = @tail
      prev.next_node = nil
      @tail = prev
      return pop_node
    end
  end

  def contains?(val)
    curr = @head
    until curr == nil do
      return true if curr.value == val
      curr = curr.next_node
    end
    return false
  end

  def find(val)
    curr = @head
    index = 0
    until curr == nil do
      return index if curr.value == val
      curr = curr.next_node
      index += 1
    end
    puts "Error: Value not found!"
    return nil
  end

  def to_s
    string = ""
    curr = @head
    until curr == nil
      string << "#{curr.value.to_s} -> "
      curr = curr.next_node
    end
    string << "nil"
    string
  end

  def insert_at(index, val)
    new_node = Node.new(val)
    prev = at(index - 1)
    curr = prev.next_node
    prev.next_node = new_node
    new_node.next_node = curr
  end

  def remove_at(index)
    prev = at(index - 1)
    prev.next_node = prev.next_node.next_node
  end
end

ll = LinkedList.new()
ll.append('a')
ll.append(2)
ll.append(3)
ll.append(456)
puts ll.to_s
ll.insert_at(2, 4982)
puts ll.to_s
ll.remove_at(4)
puts ll.to_s
p ll.head.value
p ll.tail.value