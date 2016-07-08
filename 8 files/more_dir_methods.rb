# more_dir_methods.rb

def subdirectories(dir = ".")
  Dir.foreach(dir) { |x| puts x if Dir.exists?(x) }
end