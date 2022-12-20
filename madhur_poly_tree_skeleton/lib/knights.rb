require_relative "00_tree_node"
require_relative "queue"
require_relative "stack" 
require "byebug" 
class KnightPathFinder 
    DIRECTIONS = [[2, 1], [-2, 1], [2, -1],[-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]] #[2,1]
        

    attr_reader :root_node, :considered_positions, :start_position 

    def self.valid_moves(pos) #[0, 0] we want [2, ]
        row, col = pos
        valid_pos = []
        (0...DIRECTIONS.length).each do |i| 
            curr_subarr = DIRECTIONS[i]
            first = curr_subarr[0] #= 2
            second = curr_subarr[1] #= 1
            new_pos = [first + row, second + col] 
            valid_pos << new_pos if new_pos.all? { |ele| ele >= 0 && ele <= 7 } 
        end

        return valid_pos
    end

    def initialize(start_position) # [0, 0]
        @root_node = PolyTreeNode.new(start_position)
        @considered_positions = [start_position] 
        @start_position = start_position 
    end

    def new_move_positions(pos) 
        # pos_count = Hash.new(0)
        arr = KnightPathFinder.valid_moves(pos).select { |dir| !considered_positions.include?(dir) }
        arr.each do |moves|
            considered_positions << moves 
        end
        
        return arr
    end

    def build_move_tree

        move_tree = [root_node] 
        
        until move_tree.empty? 
           
            curr_node = move_tree.shift 
            updated_pos = curr_node.value
        
            self.new_move_positions(updated_pos).each do |pos|
                next_move = PolyTreeNode.new(pos) 
                curr_node.add_child(next_move)
                move_tree << next_move 
            end

        end
    end
    
    def find_path(end_pos)    
        last_node = root_node.dfs(end_pos)
        path = trace_path_back(last_node).reverse
        path.map { |pos| pos.value }
    end

    def trace_path_back(last_node)
        path_back = []

        current_node = last_node
        until last_node.nil?
            path_back << current_node 
            current_node = last_node.parent 
        end
        return path_back 
    end

end



  