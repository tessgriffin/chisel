class Chisel

  def parse(message)
    if message.include?("### ")
      parse_header_three(message)
    elsif message.include?("## ")
      parse_header_two(message)
    elsif message.start_with?("#")
      parse_header_one(message)
    else
      parse_paragraph(message)
    end

  end

  def parse_header_one(string)
    string.gsub("# ", "<h1>") + "</h1>"
  end

  def parse_header_two(string)
    string.gsub("## ", "<h2>") + "</h2>"
  end

  def parse_header_three(string)
    string.gsub("### ", "<h3>") + "</h3>"
  end

  def parse_header_four(string)
    string.gsub("#### ", "<h4>") + "</h4>"
  end

  def parse_header_five(string)
    string.gsub("##### ", "<h5>") + "</h5>"
  end      

  def parse_paragraph(string)
    "<p>\n" + string + "\n</p>"
  end
end

chisel = Chisel.new
puts chisel.parse("### This is a header")