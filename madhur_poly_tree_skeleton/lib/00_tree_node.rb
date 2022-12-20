require_relative 'stack'
require_relative 'queue'

class PolyTreeNode
    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        "<Node: #{object_id}, value: #{value} children: #{children.map { |child| child.value } }"
    end

    def parent=(p_node) # 'a'
        return if self.parent == p_node
        if self.parent 
            self.parent.children.delete(self)
        end
        
        @parent = p_node  # 'a' 
        parent.children.push(self) if self.parent != nil  
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        node.parent = nil 
        if !children.include?(node)
            raise
        end
    end
    
    # def dfs(target) 
    #     stack = MyStack.new # []
    #     stack.push(self) #['a']
    #     until stack.empty? 
    #         curr_node = stack.pop # 'a' -> ['b', 'c']
    #         if curr_node.value == target 
    #             return curr_node 
    #         end
    #         curr_node.children.each do |child|
    #             stack.push(child) 
    #         end
    #     end
    #     return nil 
    # end
    #use self if root isn't a parameter 
    def dfs(target) 
        return self if self.value == target 
        self.children.each do |child| 
            result = child.dfs(target)
            return result unless result.nil?
        end
        
        nil 
    end


    def bfs(target)
        queue = MyQueue.new # [ ]
        queue.enqueue(self) #['a']
        until queue.empty?
            curr_node = queue.dequeue # 'a' 
            if curr_node.value == target 
                return curr_node 
            end
            curr_node.children.each do |child|
                queue.enqueue(child)
            end
        end 

        return nil
    end
    
end

