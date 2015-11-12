# Write a script that asks for two file names and copies the contents of one into the other.

puts "What is the source file?"

source_file = gets.chomp
file_content = IO.read(source_file)

puts "What is the destination file?"

destination_file = gets.chomp
new_content = destination_file.to_s

IO.write(new_content, file_content)
