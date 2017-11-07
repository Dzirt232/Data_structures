class Node # class node for binar_tree
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

def knight_moves(goal_node,start_node = $binar_tree[-1],queue=[]) # bfs algorithm for knight
  if !queue.include?(start_node) && queue == []
    queue << start_node
  end
  u = queue.delete_at(0)
  # print "\n#{u.value}\n"
  if u.value == goal_node
    track << u
    node = u
    while node.parent_nodes != []
      track << node.parents[0]
      node = node.parents[0]
    end
    track.reverse!
    puts "This is realize in #{track.length} terns."
    puts "Your shortest track: "
    track.each { |node| print "#{node.value}\n"}
    return true
  else
    u.child_nodes.each { |child| queue << child }
    if queue.length == 0
      return nil
    else
      knight_moves(goal_node,start_node,queue)
    end
  end
  # current_node = queue.delete_at(0)
  # if current_node == goal_node
  #   stack << current_node
  #   index = -1
  #   track = []
  #   while stack[index].parent != stack[0]
  #     track << stack.parent
  #     index -= 1
  #   end
  #   stack << track
  #   puts "This is realize in #{stack.length} terns."
  #   puts "Your shortest track: "
  #   stack.each { |node| print "#{node}\n"}
  #   return true
  # else
  #     i = current_node[0]
  #     j = current_node[1]
  #     for k in [-2,2] do
  #       for l in [-1,1] do
  #         current_node = [i+k,j+l]
  #         queue << current_node if $pole.include?(current_node)
  #       end
  #     end
  #     for k in [-1,1] do
  #       for l in [-2,2] do
  #         current_node = [i+k,j+l]
  #         queue << current_node if $pole.include?(current_node)
  #       end
  #     end
  #     print queue
  #     knight_moves(current_node,goal_node,queue,stack)
  #     current_node
  # end
end

def create_pole # creare pole for chess, uses only for testing: given node is be?
  pole = []
  for i in 1..8 do
    for j in 1..8 do
      pole << [i,j]
    end
  end
  pole
end

def build_tree(current_node,parent=nil) #create binar tree for start position, this has include all 64 ceils of doska
  node = Node.new(current_node)
  if parent != nil
    node.parent_add(parent)
  else
    $binar_tree << node
  end
  $length += 1
  i = current_node[0]
  j = current_node[1]
  values = []
  return true if $length == 64
  $binar_tree.each { |e| values << e.value }
  index_1   = [i+1,j+2]
  index_2   = [i+2,j+1]
  index_1_2 = [i-1,j-2]
  index_2_2 = [i-2,j-1]
  index_1_3 = [i-1,j+2]
  index_2_3 = [i+2,j-1]
  index_1_4 = [i+1,j-2]
  index_2_4 = [i-2,j+1]
  $binar_tree << node.child_add(build_tree(index_1,node))[0]  if $pole.include?(index_1) && !values.include?(index_1)
  $binar_tree << node.child_add(build_tree(index_2,node))[0]  if $pole.include?(index_2) && !values.include?(index_2)
  $binar_tree << node.child_add(build_tree(index_1_2,node))[0]  if $pole.include?(index_1_2) && !values.include?(index_1_2)
  $binar_tree << node.child_add(build_tree(index_2_2,node))[0]  if $pole.include?(index_2_2) && !values.include?(index_2_2)
  $binar_tree << node.child_add(build_tree(index_1_3,node))[0]  if $pole.include?(index_1_3) && !values.include?(index_1_3)
  $binar_tree << node.child_add(build_tree(index_2_3,node))[0]  if $pole.include?(index_2_3) && !values.include?(index_2_3)
  $binar_tree << node.child_add(build_tree(index_1_4,node))[0]  if $pole.include?(index_1_4) && !values.include?(index_1_4)
  $binar_tree << node.child_add(build_tree(index_2_4,node))[0]  if $pole.include?(index_2_4) && !values.include?(index_2_4)
  # if $length < 16 && ($pole.include?(index_1) || $pole.include?(index_2)) && (!values.include?(index_1) || !values.include?(index_2))
  #   $binar_tree << node.child_add(build_tree(index_1,node))[0]  if $pole.include?(index_1) && !values.include?(index_1)
  #   $binar_tree << node.child_add(build_tree(index_2,node))[0]
  # elsif $length >= 16 && $length < 32 && ($pole.include?(index_1_2) || $pole.include?(index_2_2)) && (!values.include?(index_1_2) || !values.include?(index_2_2))
  #   $binar_tree << node.child_add(build_tree(index_1_2,node))[0]  if $pole.include?(index_1_2) && !values.include?(index_1_2)
  #   $binar_tree << node.child_add(build_tree(index_2_2,node))[0]
  # elsif $length >= 32 && $length < 48 && ($pole.include?(index_1_3) || $pole.include?(index_2_3)) && (!values.include?(index_1_3) || !values.include?(index_2_3))
  #   $binar_tree << node.child_add(build_tree(index_1_3,node))[0]  if $pole.include?(index_1_3) && !values.include?(index_1_3)
  #   $binar_tree << node.child_add(build_tree(index_2_3,node))[0]
  # else
  #   $binar_tree << node.child_add(build_tree(index_1_4,node))[0]  if $pole.include?(index_1_4) if !values.include?(index_1_4)
  #   $binar_tree << node.child_add(build_tree(index_2_4,node))[0]  if $pole.include?(index_2_4) if !values.include?(index_2_4)
  # end

  # for l in [-1,1] do
  #   k = $length <=16 ? -2 : 2
  #   current_node_vn = [i+k,j+l]
  #   if $pole.include?(current_node_vn) && $length < 32
  #     $length += 1
  #     $binar_tree << node.child_add(build_tree(current_node_vn,current_node))[0]
  #   else
  #     break
  #   end
  # end
  #
  # for l in [-2,2] do
  #   k = $length <=48 ? -2 : 2
  #   current_node_vn = [i+k,j+l]
  #   if $pole.include?(current_node_vn) && $length < 64 && $length >= 32
  #     $length += 1
  #     $binar_tree << node.child_add(build_tree(current_node_vn,current_node))[0]
  #   else
  #     break
  #   end
  # end
  # $binar_tree << node if !$binar_tree.include?(node)
  node
end

$pole = create_pole
$binar_tree = []
$length = 0

start_node = [4,4]
build_tree(start_node)

puts $binar_tree.length

# print $binar_tree[-1].parent_nodes
$binar_tree.each { |e| print "\n#{e.value}\n" }
# print $pole
knight_moves([1,1])
