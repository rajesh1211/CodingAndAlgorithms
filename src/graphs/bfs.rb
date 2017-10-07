class Bfs
  attr_reader :graph

  def initialize(graph, start_node, fully_connected = true)
    @graph = graph
    @queue = Queue.new
    @visited = [start_node]
    @start_node = start_node
    @graph[start_node].parent = -1
    visit(@graph[start_node])
    unless fully_connected
      @graph.nodes.each do |node|
        visit(@graph[node.id])
      end
    end
  end

  def visit(node)
    @graph.loop_over_adj_list(node.id) do |list|
      unless @visited.include?(list.node.id)
        @visited << list.node.id
        if list.node.id != @start_node
          @graph[list.node.id].parent = node.id
        end
        @queue << list.node.id
      end
    end
    while(!@queue.empty?) do
      node = @queue.pop
      visit(@graph[node])
    end
  end

  def to_s
    print @visited
  end
end
