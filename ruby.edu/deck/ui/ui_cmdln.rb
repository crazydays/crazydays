require 'ui'

class CommandLineUI < UI
  def initialize(input = STDIN, output = STDOUT)
    @input = input
    @output = output
  end

  def print(message)
    @output.puts(message)
  end

  def prompt(message)
    @output.puts(message)
    @input.gets
  end
end
