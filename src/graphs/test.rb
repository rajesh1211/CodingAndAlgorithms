require 'byebug'
require_relative 'graph'
require_relative 'connected_component'
require_relative 'bfs'
require_relative 'dfs'
require_relative 'prims'
require_relative 'dijkshtra'

class Test
  def initialize
    graph = Graph.new(directed: false)
    # graph = Graph.new
    5.times {| i| graph.add_node(i+1) }
    graph.add_edge(1, 2, 3)
    graph.add_edge(1, 3, 2)
    graph.add_edge(2, 5, 2)
    graph.add_edge(4, 5, 1)
    graph.add_edge(3, 5, 4)
    puts graph
    g = graph.remove_edge(2, 5)
    puts g
    puts graph.number_of_children(1)
    puts graph.number_of_children(4)
    puts graph.has_cycle?
    puts ConnectedComponent.new(graph)
    puts Bfs.new(graph, 1)
    puts Dfs.new(graph, 1)
    puts Prims.new(graph, 1)
    puts Dijkshtra.new(graph, 1)

  end
end

Test.new
