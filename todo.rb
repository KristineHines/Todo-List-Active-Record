require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


TaskController.new.analyze_input(ARGV)

