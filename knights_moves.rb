class Node
  attr_accessor :data, :children, :parent
  def initialize(data=nil, children=[], parent=nil)
    @data = data
    @children = children
    @parent = parent
  end
end

class Tree
  attr_accessor :destination, :parent
  def initialize(start, finish)
    @destination = nil
    @parent = nil
    @root = build_tree(start, finish)
  end

  def build_tree(start, finish)
    queue = []
    queue.push(Node.new(start))
    found = false
    @parent = nil
    until found
      if queue[0].data == finish
        found = true
        @destination = queue[0]
      else
        @parent = queue[0]
        queue[0].children = populate(queue[0].data)
        queue += queue[0].children
        queue.shift
      end
      # if queue.include?(finish)
      #   found = true
      #   @destination = queue[queue.index(finish)]
      # else
      #   queue.each do |y|
      #     children = valid_children(y)
      #     child_array += children
      #     node = Node.new(y, children, parent)
      #     if node.data == finish
      #       found = true
      #       @destination = node
      #     end
      #   end
      #   parent = queue[0]
      #   queue += child_array
      #   child_array = []
      #   queue.shift
      # # end
    end
  end

  def path
    pathway = []
    current_node = @destination
    done = false
    until done
      if current_node.parent == nil
        done = true
      else
        pathway.push(current_node.data)
        current_node = current_node.parent
      end
    end
    pathway.push(current_node.data)
    pathway.reverse!
    pathway
  end

  def populate(array) # returns array of nodes with no children
    result = []
    if (array[0] + 1).between?(0, 8) && (array[1] + 2).between?(0, 8)
      result.push(Node.new([(array[0] + 1), (array[1] + 2)], [], @parent))
    end
    if (array[0] + 2).between?(0, 8) && (array[1] + 1).between?(0, 8)
      result.push(Node.new([(array[0] + 2), (array[1] + 1)], [], @parent))
    end
    if (array[0] - 1).between?(0, 8) && (array[1] - 2).between?(0, 8)
      result.push(Node.new([(array[0] - 1), (array[1] - 2)], [], @parent))
    end
    if (array[0] - 2).between?(0, 8) && (array[1] - 1).between?(0, 8)
      result.push(Node.new([(array[0] - 2), (array[1] - 1)], [], @parent))
    end
    if (array[0] + 1).between?(0, 8) && (array[1] - 2).between?(0, 8)
      result.push(Node.new([(array[0] + 1), (array[1] - 2)], [], @parent))
    end
    if (array[0] + 2).between?(0, 8) && (array[1] - 1).between?(0, 8)
      result.push(Node.new([(array[0] + 2), (array[1] - 1)], [], @parent))
    end
    if (array[0] - 2).between?(0, 8) && (array[1] + 1).between?(0, 8)
      result.push(Node.new([(array[0] - 2), (array[1] + 1)], [], @parent))
    end
    if (array[0] - 1).between?(0, 8) && (array[1] + 2).between?(0, 8)
      result.push(Node.new([(array[0] - 1), (array[1] + 2)], [], @parent))
    end
    result
  end
end

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
  print tree.path
end

# [1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-2, 1]
# [-1, 2]

knight_moves([3, 3], [0,0])