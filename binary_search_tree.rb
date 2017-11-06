class Node
  attr_accessor :value, :parent_nodes, :child_nodes

  def initialize(value)
    @value = value
    @parent_nodes = []
    @child_nodes = []
  end

  def parent_add(value)
    @parent_nodes << value
  end

  def child_add(value)
    @child_nodes << value
  end

  def parents
    @parent_nodes.each {|parent|
      print "#{parent} "
    }
  end

  def childs
    @child_nodes.each {|child|
      print "#{child} "
    }
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
  value
end

$binar_tree = []
build_tree([1, 2, 5, 6, 9, 10, 12])
$binar_tree.each {|e| e.parents}
