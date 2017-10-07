class Adjacent
  attr_accessor :weight, :node, :next_node
  def initialize(node:, next_node: nil, weight: 1)
    @node = node
    @weight = weight
    @next_node = next_node
  end
end
