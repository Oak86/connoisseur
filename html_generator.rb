require 'json'
require 'open-uri'

class HtmlGenerator
	def index
	html_header
	parsed_index = pull_data("http://lcboapi.com/products")

		parsed_index.each do |drink|
			html_body(drink)
			# p "<div class = 'drink'>"
			# p "<h2>#{parsed_index['name']}</h2>"
			# p "<ul>"
			# p "<li>#{drink['origin']}</li>"
			# p "<li>$#{"%.2f" % (drink['price_in_cents'].to_f / 100)}</p>"
			# p "</ul>"
			# p "</div>"
	    end
	html_footer
	end

	def show(id)
	html_header
	## Show needs to display the features from the product ID that has been entered.
	## To prove that this has worked, we'll use the ID 00681, and that should return
	## the information for Coors Light. 

	parsed_index = pull_data("http://lcboapi.com/products/#{id}")

	html_body(parsed_index)
	 
	html_footer
	end	
	def html_body(x)
		p "<div class = 'drink'>"
		p "<h2>#{x['name']}</h2>"
		p "<ul>"
		p "<li>#{x['origin']}</li>"
		p "<li>$#{"%.2f" % (x['price_in_cents'].to_f / 100)}</li>"
		p "</ul>"
		p "</div>"
	end	

	def pull_data(url)
		raw_data = open(url).read
		parsed_data = JSON.parse(raw_data)

		return parsed_data['result']
		## Trying to return multiple pages... will continue this later...
		#pager_info = parsed_data['pager']
		#until pager_info['records_per_page']
		#puts parsed_data['pager["records_per_page"]']
					#puts parsed_data['result']	end
	end

	def html_header
		p 	"<html>"
		p 	"<head>" 
		p 	"<title>LCBO Connoisseur</title>"
		p   "</head>"
		p 	"<body>"
		p   "<h1> Index of Products </h1> "
	end

	def html_footer
		p "</body>"
		p "</html>"	
	end
end

generator = HtmlGenerator.new
generator.index
#generator.show(300681)


## Some notes:
# When I tried to run the ruby file I kept getting this error:
	#html_generator.rb:30:in `[]': no implicit conversion of Symbol into Integer (TypeError)
	# => from html_generator.rb:30:in `block in index'
	#	from html_generator.rb:25:in `each'
	#	from html_generator.rb:25:in `index'
	#	from html_generator.rb:65:in `<main>'

# I looked this up and got this link:
# https://www.ruby-forum.com/topic/171241

# The issue seems to be that ruby can't return a nil value. So I gotta account for that.

# nope, I was wrong. the real reason why this wasn't working was that the method I'd created to pull data
#was not calling on the correct hash. The loop was looking for a hash with the key "name" but all it could find 
# was result and pager. Duh?
