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
      puts "Error: Index overflow!"
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
end

ll = LinkedList.new()
ll.append('a')
ll.append(2)
ll.append(3)
ll.append(456)
p ll.pop.value
p ll.tail.value