class DotWriter
  def initialize(graph, strong_components=[])
    @component_counter = 0
    @graph = graph
    @strong_components = strong_components
  end

  def to_dot(dotfile=STDOUT)
    f = File.open(dotfile, 'w+') if !(dotfile.class == STDOUT.class)
    f = dotfile if dotfile.class == STDOUT.class
    f.puts 'strict digraph resultado_exemplo {'
    write_edges f
    @strong_components.each {|k, c| write_strong_components_subgraph(f, c)}
    f.puts '}'
    f.close if !(dotfile.class == STDOUT.class)
  end

  private

  def write_strong_components_subgraph(f, components)
    @component_counter += 1
    f.puts "  subgraph cluster#{@component_counter} {"
    components.each { |c| f.puts "    #{c};" }
    f.puts '  }'
  end

  def write_edges(f)
    @graph.edges.each do |edge|
      f.puts "  #{edge.from} -> #{edge.to};"
    end
  end
end


class DotParser

  def self.parse(dotfile, graph)
    new(graph).parse(dotfile)
  end

  def initialize(graph_builder)
    @graph_builder = graph_builder
    @nodes = []
    @edges = []
  end

  def parse(dotfile)
    File.open(dotfile) do |f|
      f.each_line do |line|
        puts line
        edge_from_string line.split('->') if line.match(/->/)
      end
      @edges.each {|parent, child| add_edge parent, child}
    end
    @graph_builder
  end

  private

  def edge_from_string(line)
    parent = add_node(line[0].strip)
    child = add_node(line[1].strip.tr(';', ''))

    edge = [parent, child]
    @edges << edge
  end

  def add_node(node)
    n = Node.new(node)
    # unless @nodes.include? node
    # unless @graph_builder.nodes.include? node
    @graph_builder.add_node(n)
      # @nodes << node
    # else
    # end
  end

  def add_edge(a, b)
    @graph_builder.add_edge(a, b)
  end

end