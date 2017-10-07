class ConnectedComponent
  attr_reader :graph
  def initialize(graph)
    @color = 1
    @graph = graph
    @graph.nodes.each do |node|
      color(node.id)
    end
  end

  def color(node_id)
    node = @graph[node_id]
    if node.color.nil?
      node.color = @color
      @graph[node_id].color = @color
      @color = @color + 1
    end

    @graph.loop_over_adj_list(node.id) do |list|
      if @graph[list.node.id].color.nil?
        @graph[list.node.id].color = node.color
        color(list.node.id)
      end
    end
  end

  def to_s
    print @graph.adjacency_lists.map {|adj_list| adj_list[:node]}.group_by(&:color)
  end
end
