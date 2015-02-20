require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel.rb'

class ChiselTest < Minitest::Test
  def test_it_exists
    assert Chisel
  end 

  def test_it_can_change_a_header_one
    chisel = Chisel.new
    string = "# My Life in Desserts"
    output = chisel.parse_header_one(string)
    assert_equal "<h1>My Life in Desserts</h1>", output
  end

  def test_it_can_change_a_header_two
    chisel = Chisel.new
    string = "## Chapter 1: The Beginning"
    output = chisel.parse_header_two(string)
    assert_equal "<h2>Chapter 1: The Beginning</h2>", output
  end

  def test_it_can_change_a_header_three
    chisel = Chisel.new
    string = "### Chapter 1: The Beginning"
    output = chisel.parse_header_three(string)
    assert_equal "<h3>Chapter 1: The Beginning</h3>", output
  end

  def test_it_can_change_a_header_four
    chisel = Chisel.new
    string = "#### Chapter 1: The Beginning"
    output = chisel.parse_header_four(string)
    assert_equal "<h4>Chapter 1: The Beginning</h4>", output
  end

  def test_it_can_change_a_header_five
    chisel = Chisel.new
    string = "##### Chapter 1: The Beginning"
    output = chisel.parse_header_five(string)
    assert_equal "<h5>Chapter 1: The Beginning</h5>", output
  end

  def test_it_can_parse_a_paragraph
    chisel = Chisel.new
    string = "This is the paragraph"
    output = chisel.parse_paragraph(string)
    assert_equal "<p>\nThis is the paragraph\n</p>", output
  end

  def test_it_can_parse_em
    chisel = Chisel.new
    string = "*string*"
    output = chisel.parse_em(string)
    assert_equal "<em>string</em>", output
  end

  def test_it_can_parse_strong
    chisel = Chisel.new
    string = "**string**"
    output = chisel.parse_strong(string)
    assert_equal "<strong>string</strong>", output
  end  

  def test_it_can_parse_strong_in_parse
    skip
    chisel = Chisel.new
    string = "**string**"
    output = chisel.parse(string)
    assert_equal "<strong>string</strong>", output
  end 

  def test_it_can_parse_one_line_with_header_one
    chisel = Chisel.new
    string = "# My Life in Desserts"
    output = chisel.parse(string)
    assert_equal "<h1>My Life in Desserts</h1>", output
  end

  def test_it_can_parse_one_line_with_header_two
    chisel = Chisel.new
    string = "## My Life in Desserts"
    output = chisel.parse(string)
    assert_equal "<h2>My Life in Desserts</h2>", output
  end

  def test_it_can_parse_one_line_with_header_three
    chisel = Chisel.new
    string = "### My Life in Desserts"
    output = chisel.parse(string)
    assert_equal "<h3>My Life in Desserts</h3>", output
  end

  def test_it_can_parse_a_paragraph_when_read_in
    chisel = Chisel.new
    string = "My Paragraph"
    output = chisel.parse(string)
    assert_equal "<p>\nMy Paragraph\n</p>", output
  end

  def test_it_can_separate_a_string_by_line_breaks
    chisel = Chisel.new
    string = "# My Life in Desserts\n## Chapter 1: The Beginning"
    output = chisel.separate_string(string)
    assert_equal ["# My Life in Desserts", "## Chapter 1: The Beginning"], output
  end

  def test_it_can_join_separated_strings
    chisel = Chisel.new
    array = ["# My Life in Desserts", "## Chapter 1: The Beginning"]
    output = chisel.join_strings(array)
    assert_equal "# My Life in Desserts\n## Chapter 1: The Beginning", output
  end

  def test_it_parses_two_multiple_lines
    chisel = Chisel.new
    string = "# My Life in Desserts\n## Chapter 1: The Beginning"
    output = chisel.parse(string)
    assert_equal "<h1>My Life in Desserts</h1>\n<h2>Chapter 1: The Beginning</h2>", output        
  end

  def test_it_parses_multiple_lines
    chisel = Chisel.new
    string = File.read("./sample_1.md")
    output = chisel.parse(string)
    assert_equal "<h1>My Life in Desserts</h1>\n<h5>Chapter 1: The Beginning</h5>\n<p>\nYou just *have* to try the cheesecake, he said. Ever since it appeared\nin **Food & Wine** this place\nhas been packed every night.\n</p>", output        
  end

end