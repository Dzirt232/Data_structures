class Node
  attr_accessor :value, :parent_nodes, :child_nodes

  def initialize(value)
    @value = value
    @parent_nodes = []
    @child_nodes = []
  end

  def parent_add(node)
    @parent_nodes << node
  end

  def child_add(node)
    @child_nodes << node
  end
end

def build_tree(array,parent=nil)
  if array.class == Array
    array.sort!
    n = array.length
  else
    n = 1
  end
  value = n != 1 ? array[n/2] : array[0]
  node = Node.new(value)
  node.parent_add(parent) if parent != nil
  if n>2
    node.child_add (build_tree(array[0..n/2-1],value))
    node.child_add (build_tree(array[n/2+1..n],value))
  elsif n == 2
    node.child_add (build_tree(array[0],value))
    node.child_add (build_tree(array[1],value))
  end
  $binar_tree << node
  node
end

def breadth_first_search( goal_node,start_node = $binar_tree[-1], queue = [])
  queue << start_node if !queue.include?(start_node)
  u = queue.delete_at(0)
  if u.value == goal_node
    puts u.value
    return true
  else
    u.child_nodes.each { |child| queue << child }
    if queue.length == 0
      return nil
    else
      breadth_first_search(goal_node,queue[0],queue)
    end
  end
end

$binar_tree = []
build_tree([1, 2, 5, 6, 9, 10, 12])
print $binar_tree
puts
puts breadth_first_search(6)
puts
p breadth_first_search(11)
