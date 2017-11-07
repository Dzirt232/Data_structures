class Node
  attr_accessor :value

  def initialize(value)
    @value = value
  end
end

def knight_moves
  current_move = nil
  $path.each do |key, value|
     if key.value == $start_node
       current_move = key
       break
     end
  end
  final_path = Array.new
  total_moves = 0
  while $path.has_key?(current_move)
    final_path.push(current_move.value)
    total_moves += 1
    if current_move.value == $path[current_move].value  then
      break
    else
      current_move = $path[current_move]
    end
  end

  puts "You made #{total_moves} moves. Your path is:"
  print final_path
  puts " "
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

def find_path(start_node,goal_node) #bfs alghorithm without recursion
  beginning = Node.new(goal_node)
  $path = {}
  $nodes = []
  $nodes << beginning
  $visited = []
  while !$nodes.empty?
    current_node = $nodes.shift
    return current_node if current_node.value == start_node
    determine_neighbors_of(current_node)
  end
end

def determine_neighbors_of(current_node)

        add_neighbor_node(current_node, current_node)

        neighbor_node = Node.new([current_node.value[0]-2, current_node.value[1] - 1])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]-1, current_node.value[1] - 2])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]+2, current_node.value[1] + 1])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]+1, current_node.value[1] + 2])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]-2, current_node.value[1] + 1])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]-1, current_node.value[1] + 2])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]+2, current_node.value[1] - 1])
        add_neighbor_node(current_node,neighbor_node)

        neighbor_node = Node.new([current_node.value[0]+1, current_node.value[1] - 2])
        add_neighbor_node(current_node,neighbor_node)
end

def add_neighbor_node(current_node, neighbor_node)
      if $pole.include?(neighbor_node.value) && !$visited.include?(neighbor_node)
          $visited << neighbor_node
          $nodes.push(neighbor_node)
          $path[neighbor_node] = current_node
      end
end

$pole = create_pole

$start_node = [4,4]
$goal_node = [1,1]
find_path($start_node,$goal_node)

knight_moves
