class BellmanFord
  attr_reader :graph

  def initialize(graph, start_node)
    @graph = graph
    # @visited = [start_node]
    @distance = Array.new(@graph.adjacency_lists.size, Float::INFINITY)
    @distance[0] = 0
    bellman_iterations
    # visit
  end

  def bellman_iterations
    @graph.nodes.each_with_index do |node, index|
      old_distance = @distance
      visited = [node.id]
      visit(@graph[node.id], visited)
      new_distance = @distance
      break (old_distance - new_distance).size == 0
    end
    print @distance
  end

  def visit(node, visited)
    while(visited.size != @graph.adjacency_lists.size) do
      min_distance = Float::INFINITY
      considered_node = nil
      visited.each do |node_id|
        node = @graph[node_id]
        graph.loop_over_adj_list(node.id) do |list|
          unless visited.include?(list.node.id)
            if @distance[node_id-1] + list.weight < min_distance
              min_distance = @distance[node_id-1] + list.weight
              considered_node = list.node.id
            end
          end
        end
      end
      break if considered_node.nil?
      visited << considered_node
      @distance[considered_node-1] = min_distance
    end
  end

  def to_s
    print "distance-from-start-nodes: #{@distance}"
  end

end
