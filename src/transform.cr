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

  def upcase(input)
    input.upcase
  end

  def downcase(input)
    input.downcase
  end

  def circle(input)
    String.build do |s|
      input.each_char do |char|
        case char.to_s
        when .match(/[A-Z]/)
          s << char + 0x2475
        when .match(/[a-z]/)
          s << char + 0x246F
        when .match(/[0]/)
          s << char + 0x24BA
        when .match(/[1-9]/)
          s << char + 0x242F
        else
          s << char
        end
      end
    end
  end
end
