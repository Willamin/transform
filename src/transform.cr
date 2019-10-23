module Transform
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  extend self

  def fullwidth(input)
    String.build do |s|
      input.each_char do |char|
        case char.to_s
        when .match(/[a-zA-Z]/)
          s << char + 0xFEE0
        else
          s << char
        end
      end
    end
  end
end
