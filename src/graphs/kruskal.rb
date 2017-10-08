class Kruskal
  attr_reader :graph

  def initialize(graph, start_node)
    @graph = graph
    @visited = []
    @sets = Array.new(@graph.nodes.size)
    @graph.nodes.each_with_index do |node, index|
      @sets[index] = [node.id]
    end
    visit
    update_visited_nodes
  end

  def in_same_sets(from, to)
    from_index = @sets.index { |set| set.include? from}
    to_index = @sets.index { |set| set.include? to}
    if from_index == to_index
      {
        in_same_sets: true,
        index: from_index
      }
    else
      @sets[from_index] << @sets[to_index]
      @sets[from_index].flatten!
      @sets.delete_at(to_index)
      {
        in_same_sets: false,
        index: from_index
      }
    end
  end

  def visit
    @edges = @graph.edges.sort_by(&:weight)
    @edges.each do |edge|
      unless in_same_sets(edge.from, edge.to)[:in_same_sets]
        @visited << edge
      end
    end
  end

  def update_visited_nodes
    temp_visited = []
    @visited.each do |edge|
      unless temp_visited.include?(edge.from)
        temp_visited << edge.from
      end

      unless temp_visited.include?(edge.to)
        temp_visited << edge.to
      end
    end
    @visited = temp_visited
  end

  def to_s
      print "visit-order: #{@visited}"
      # puts ""
      # print "distance-from-start-nodes: #{@distance}"
    end
end
