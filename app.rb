require_relative 'graph'
require_relative 'node'
require_relative 'edge'
require_relative 'strong_components'
require_relative 'parser'

class App
  def self.run(dotfile)
    @graph = Graph.new
    parser = DotParser.parse dotfile, @graph
    #puts @parser.inspect
    strong_components = StrongComponents.new(parser).strong_components

    #strong_components.each do |key, component|
    #  puts component
    #end

    writer = DotWriter.new parser, strong_components
    writer.to_dot 'resultado.dot'
  end
end