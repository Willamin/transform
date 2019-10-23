require "option_parser"
require "./transform"

enum Action
  Fullwidth
  Upcase
  Nothing
end

action_to_take : Action = Action::Nothing

parser = OptionParser.new do |parser|
  parser.banner = "usage: transform"

  parser.on("-v", "--version", "display the version") { puts Transform::VERSION; exit 0 }
  parser.on("-h", "--help", "show this help") { puts parser; exit 0 }

  parser.on("-F", "--fullwidth", "fullwidth") { action_to_take = Action::Fullwidth }
  parser.on("-U", "--upcase", "upcase") { action_to_take = Action::Upcase }

  parser.unknown_args { |args| ARGV.replace(args) }
end

parser.parse!

input = ARGV.join(" ")

case action_to_take
when .fullwidth? then puts Transform.fullwidth(input)
when .upcase?    then puts Transform.upcase(input)
when .nothing?   then puts input
end
