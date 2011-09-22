class Failtrain
  def self.construct(sentences)
    head = <<-EOS
    o o o o o o o . . .    
   o      _____            
 .][__n_n_|DD[  ====_____  
>(________|__|_[_________]_
_/oo OOOOO oo`  ooo   ooo  
-+-+-+-+-+-+-+-+-+-+-+-+-+-
EOS

    carriage_start = <<-EOS
 _______
 |      
 | XXXXX
_|______
 'o!o!o 
-+-+-+-+
EOS
    carriage_middle = <<-EOS
__
  
XX
__
  
-+
EOS
    carriage_end = <<-EOS
_______
      |
XXXXX |
______|
 o!o!o`
-+-+-+-
EOS

    parts = [head]
    line_length = head.lines.first.length
    sentences.each do |word|
      len = word.length
      line_length += len + 4
      mid_n = ([0, (len - 10)].max + 1) / 2
      parts << carriage_start.gsub("XXXXX", "%5s" % word[0..4])
      mid_n.times do |n|
        parts << carriage_middle.gsub("XX", "%-2s" % word[5 + n * 2 .. 6 + n * 2])
      end
      parts << carriage_end.gsub("XXXXX", "%-5s" % word[5 + mid_n * 2 .. -1])
      if line_length > 80
        line_length = 0
        parts << :break
      end
    end

    buffer = ''
    a = parts.first
    parts[1..-1].each do |v|
      a = if v == :break
        buffer += a + "\n"
        "\n" * 6
      else
        a.lines.to_a.map(&:chomp).zip(v.lines.to_a.map(&:chomp)).map(&:join).join("\n")
      end
    end
    buffer += a if a.length > 6
    buffer
  end
end
