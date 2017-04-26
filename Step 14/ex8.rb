# method 1 - $PROGRAM_NAME can be used instead of $0
File.foreach($0) do |line|
  puts line
end

# method 2 - __FILE__ relative path from current exec directory
File.foreach(__FILE__) do |line|
  puts line
end

# IO method to open and read file
print IO.read(__FILE__)
