require_relative 'graph'
require_relative 'node'
require_relative 'edge'
require_relative 'strong_components'
require_relative 'parser'

class App
  def self.run(dotfile)
    @graph = Graph.new
    @graph2 = Graph.new
    parser = DotParser.parse dotfile, @graph
    original = DotParser.parse dotfile, @graph2
    strong_components = StrongComponents.new(parser).strong_components
    writer = DotWriter.new original, strong_components
    writer.to_dot 'resultado.dot'
  end
end