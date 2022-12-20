class MyQueue

    def initialize
        @store = [] 
    end

    def enqueue(el)
        # you could do << depending on what side people on entering your queue 
        store.unshift(el) 
        el
    end

    def dequeue
        # you could do .shift here depending on what side people are exiting your queue 
        store.pop 
    end

    def show
        # can also puts store 
        store.dup 
    end

    def empty?
        store.empty?
    end

    def size
        store.length 
    end

    private
    attr_reader :store 
    
end