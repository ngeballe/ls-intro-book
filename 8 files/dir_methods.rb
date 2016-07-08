# dir_methods.rb

require "pry"
# add binding.pry where I want to debug

def show_line(length = 70)
  puts "-" * length
end

def show_options
  options = [
            "Type \"show\" to show the current directory and the files in it",
             "Type \"create [filename]\" to create a file",
             "Type \"read [filename]\" to read a file",
             "Type \"open [filename]\" or \"add to [filename]\"  to add text to a file",
             "Type \"overwrite [filename]\" to overwrite a file",
             "Type \"delete [filename] [filename2]...\" to delete file(s)",
             "Type \"copy [filename] [new filename]\" to copy a file (Note: copying to an existing file will overwrite its contents)",
             "Type \"rename [filename] [new name]\" to rename a file",
             "Type \"change [file type suffix] to [new file type suffix] to change files. For example \"change .png to .jpg\" will change all .png files in the directory to .jpg files. (Add \"in [directory name]\" at the end to make the change in a different directory.)",
             "Type \"files in [directory path]\" to see what files are in a directory",
             "Type \"q\" to quit"
             ]
  options.each { |option| puts "- #{option}" }
  puts
  #puts "Enter 'copy [filename] to copy a file'
end

def parse_command(command)
  puts
  command.strip!
  words_in_command = command.split(" ")
  show_line
  if command == "show"
    show
  elsif command.start_with?("create")
    filename = words_in_command[1]
    create_file(filename)
  elsif command.start_with?("read")
    filename = words_in_command[1]
    read_file(filename)
  elsif command.start_with?("add to")
    filename = words_in_command[2]
    add_to_file(filename)
  elsif command.start_with?("open")
    filename = words_in_command[1]
    add_to_file(filename)
  elsif command.start_with?("overwrite")
    filename = words_in_command[1]
    overwrite_file(filename)
  elsif command.start_with?("delete")
    files = words_in_command[1..-1]
    if files.size == 1
      delete_file(files[0])
    elsif files.size > 1
      # delete multiple files
      delete_multiple_files(files)
    end
    show
  elsif command.start_with?("copy")
    filename = words_in_command[1]
    new_filename = words_in_command[2]
    copy_file(filename, new_filename)
  elsif command.start_with?("rename")
    filename = words_in_command[1]
    new_filename = words_in_command[2]
    rename_file(filename, new_filename)
  elsif command.match(/change \.\w+ to \.\w+/)
    current_file_type = words_in_command[1]
    new_file_type = words_in_command[3]
    if command.match(/in \w+\z/)
      directory = command.split(" in ")[1]
      batch_file_type_change(current_file_type, new_file_type, directory)
    else
      batch_file_type_change(current_file_type, new_file_type)
    end
  elsif command.start_with?("files in")
    directory = command.split("files in")[1].strip
    files_in_directory(directory)
  else
    puts "Sorry, dear, I'm not sure what you mean. Please enter a valid command."
  end
  show_line
  puts
end

def show
  puts "Current directory: \"#{Dir.pwd}\""
  puts "File in this directory: #{Dir.entries(".")}"
end

def gets_from_multiple_lines
  text = ""
  last_line = ""
  while last_line != "\n"
    last_line = gets
    text += last_line unless last_line == "\n"
  end
  text
end

TEXT_ENTRY_MESSAGE = "Enter text in the file. Leave a line blank  to quit."

def create_file(filename)
  file = File.new(filename, "w")
  file.close
  puts "Created file \"#{filename}\""
  puts TEXT_ENTRY_MESSAGE
  show_line
  file_contents = gets_from_multiple_lines.chomp
  unless file_contents.empty?
    File.open(filename, "w") { |file| file.puts(file_contents) }
    show_line
    puts "File saved"
  end
  show
end

def read_file(filename)
  file_contents = File.read(filename)
  puts file_contents
end

def add_to_file(filename)
  file_contents = File.read(filename)
  puts TEXT_ENTRY_MESSAGE.sub("text", "more text")
  show_line
  puts file_contents
  edits = gets_from_multiple_lines.chomp
  File.open(filename, "a") { |f| f.puts(edits) }
end

def overwrite_file(filename)
  puts "Are you sure? This cannot be undone. Type \"y\" if yes."
  reply = gets.chomp
  return unless reply == "y"
  puts "Overwriting file."
  puts TEXT_ENTRY_MESSAGE
  puts
  new_contents = gets_from_multiple_lines.chomp
  File.open(filename, "w") { |f| f.write(new_contents) }
end

def delete_file(filename, confirm=true)
  if filename == $0
    puts "You can't delete this program!"
    puts
    return
  end
  if confirm
    puts "Are you sure you want to delete \"#{filename}\"? Type \"y\" if yes."
    reply = gets.chomp
    return unless reply == "y"
  end
  File.delete(filename)
  puts "File deleted"
end

def delete_multiple_files(files, confirm=true)
  if confirm
    puts "Are you sure you want to delete the files \"#{files}\"? Type \"y\" if yes."
    reply = gets.chomp
    return unless reply == "y"
  end
  files.each do |file|
    File.delete(file)
  end
  puts "Files deleted"
end

def copy_file(filename, new_filename)
  file_contents = File.read(filename)
  File.open(new_filename, "w") { |new_file| new_file.write(file_contents)}
  puts "Copied the file \"#{filename}\" to the new file \"#{new_filename}\""
end

def rename_file(filename, new_filename)
  file_contents = File.read(filename)
  File.open(new_filename, "w") { |new_file| new_file.write(file_contents)}
  File.delete(filename)
  puts "The file \"#{filename}\" has been renamed \"#{new_filename}\""
end

def batch_file_type_change(current_file_type, new_file_type, directory=".")
  all_directory_files = Dir.entries(directory)
  files_to_change = all_directory_files.select { |file| file.end_with?(current_file_type) } # select the ones of the current_file_type
  files_to_change.each do |file|
    rename_file("#{directory}/#{file}", "#{directory}/#{file}".sub(current_file_type, new_file_type))
  end
  new_files = Dir.entries(directory).select { |f| f.end_with?(new_file_type) }
end

def files_in_directory(directory)
  files = Dir.entries(directory)
  real_files = files.reject { |filename| [".", ".."].include?(filename) }
  if real_files.size == 1
    puts "There is 1 file in the directory \"#{directory}\":" # really should show absolute path name, not just what user typed
  else
    puts "There are #{real_files.size} files in the directory \"#{directory}\":"
  end
  puts
  puts real_files
end


puts
show
puts
while true
  show_options  
  command = gets.chomp
  break if command == "q"
  parse_command(command)
end



# puts "Enter a directory path (. = current directory, .. = parent)"
# directory = gets.chomp

# puts "\nThe files in the directory \"#{directory}\" are:"
# puts Dir.entries(directory)

# puts

# puts "To read a file, enter the file's name:"

# file_contents = File.read(filename)

# puts
# puts file_contents



