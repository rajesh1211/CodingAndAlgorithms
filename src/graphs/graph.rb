require 'byebug'
require_relative './edge'
require_relative './node'
require_relative './adjacent'
require_relative './dfs'

class Graph
  attr_reader :adjacency_lists, :directed, :edges

  def initialize(directed: true)
    @adjacency_lists = []
    @directed = directed
    @edges = []
  end

  def add_node(id)
    if @adjacency_lists[id-1].nil?
      @adjacency_lists[id-1] = {
        node: Node.new(id),
        list: []
      }
    end
  end

  def add_edge(from, to, weight = nil)
    add_individual_edge(from, to, weight)
    @edges << Edge.new(from, to, weight)
    unless directed
      add_individual_edge(to, from, weight)
    end
  end

  def loop_over_adj_list(node_id, &block)
    @adjacency_lists[node_id-1][:list].each do |list|
      yield list if block_given?
    end
  end

  def has_cycle?
    _graph = Dfs.new(self, 1)
    return _graph.has_cycle || false
  end

  def number_of_children(node_id)
    sum = 0
    visited_nodes = []
    children(node_id, sum, visited_nodes)
  end

  def distance(node)
    sum = 0
    if node.parent != -1
      if node.parent == nil
        sum = -1
      else
        while(node.parent && node.parent != -1) do
          sum = sum + 1
          node = self[node.parent]
        end
      end
    end
    sum
  end

  def remove_edge(from, to)
    graph = Marshal.load(Marshal.dump(self)) # deep copy
    _remove_edge(graph, from, to)
  end

  def remove_edge!(from, to)
    graph = self
    _remove_edge(graph, from, to)
  end

  def nodes
    @adjacency_lists.map {|adj_list| adj_list[:node]}
  end

  def [](id)
    @adjacency_lists[id-1][:node] if @adjacency_lists[id-1]
  end

  def to_s
    @adjacency_lists.each_with_index do |adj_list, index|
      print "node: #{index+1}, parent: #{adj_list[:node].parent}, adjacency_list: ["
      adj_list[:list].each do |list|
        print "{ node: #{list.node.id}"
        print ", weight: #{list.weight} },"
      end
      print "]"
      puts ""
    end
  end

  private
    def add_individual_edge(from, to, weight = nil)
      adjacency_list = @adjacency_lists[from-1][:list]
      unless adjacency_list.empty?
        adjacency_list.last.next_node = to
      end
      if weight.nil?
        adjacency_list << Adjacent.new(node: self[to])
      else
        adjacency_list << Adjacent.new(node: self[to], weight: weight)
      end
    end

    def children(node_id, sum, visited_nodes)
      loop_over_adj_list(node_id) do |list|
        unless visited_nodes.include? list.node.id
          visited_nodes << list.node.id
          sum = 1 + children(list.node.id, sum, visited_nodes)
        end
      end
      sum
    end

    def _remove_edge(graph, from, to)
      graph.adjacency_lists[from-1][:list] = graph.adjacency_lists[from-1][:list].delete_if { |adj| adj.node.id == to}
      unless directed
        graph.adjacency_lists[to-1][:list] = graph.adjacency_lists[to-1][:list].delete_if { |adj| adj.node.id == from}
      end
      graph
    end
end
