require "option_parser"
require "./transform"

parser = OptionParser.new do |parser|
  parser.banner = "usage: transform"

  parser.on("-v", "--version", "display the version") { puts Transform::VERSION; exit 0 }
  parser.on("-h", "--help", "show this help") { puts parser; exit 0 }
end

parser.parse!
