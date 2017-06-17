class Graph
  attr_accessor :nodes
  attr_accessor :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    if nodes.any?{|n| n.name == node.name}
      node = nodes.find{|n| n.name == node.name}
    else
      nodes << node
      node.graph = self
    end

    node

  end

  def add_edge(from, to)
    edges << Edge.new(from, to)
  end

  def reverse!
    edges.each do |e|
      e.from, e.to = e.to, e.from
    end
  end
end
