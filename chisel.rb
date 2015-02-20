class Chisel

  def parse(message)
    separated_string = separate_string(message)
    markdown_array = separated_string.map do |string|
      if string.start_with?("##### ")
        parse_header_five(string)
      elsif string.start_with?("#### ")
        parse_header_four(string)
      elsif string.start_with?("### ")
        parse_header_three(string)
      elsif string.start_with?("## ")
        parse_header_two(string)
      elsif string.start_with?("#")
        parse_header_one(string)
      else
        parse_paragraph(string)
      end
    end
    join_strings(markdown_array)
  end

  def join_strings(array)
    array.join("\n")
  end

  def separate_string(string)
    string.split(/^\n/).flat_map do |line|
      if line.include?("#")
        line.split("\n")
      else
        line
      end
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

  def parse_em(string)
    "<em>" + string.delete("*") + "</em>"
  end

  def parse_strong(string)
    "<strong>" + string.delete("*") + "</strong>"
  end
end
