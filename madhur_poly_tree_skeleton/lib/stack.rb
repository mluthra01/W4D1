class MyStack
   
    # we're using a class for this stack because we don't want all the functionalities of an array 
    def initialize 
        # use array as a underlying data structure for our stack 
        @store = []
    end

    #overwriting the inspect method can help identify objects easier 
    def inspect
        "#<MyStack:#{self.object_id} last element: #{peek}>"
    end

     # our push method is showing the entire array, we just want to s
    def push(value)
        store.push(value) 
        value # this allows us to just see a single value being pushed in, instead of the entire array 
    end

    def pop
        store.pop
    end

    def peek
        store[-1]
    end

    def size
        store.length
    end

    def empty?
        store.empty? 
    end
    
    private # makes it so you can't access the attr_reader from the outside, only inside 
    attr_reader :store 

end