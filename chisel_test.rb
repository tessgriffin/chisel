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


end