require_relative 'html_generator'

if ARGV.empty?
	puts "Usage: ruby router.rb [action]"
else
	generator = HtmlGenerator.new
	action  = ARGV[0]
	
	if action == "index"
		generator.index
	elsif action == "show"
		id = ARGV[1]
		generator.show(id)
	else
		puts "Unknown action #{action}. Use index or show."
	end
end