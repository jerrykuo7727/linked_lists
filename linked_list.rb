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
end

ll = LinkedList.new()
ll.append(2)
ll.prepend(3)