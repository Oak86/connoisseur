require 'json'
require 'open-uri'

## This purpose of this app is to output a fully generated HTML file based on the ARGV passed
## in through the router.
class HtmlGenerator
	def index
	## Index needs to display a list of products in html form.
	## Anything that's not related to the output should not be in this method.
	
	## First, an html header needs to be printed
	## html_header <--- This needs to become a method for later, but for now...
		p 	"<html>"
		p 	"	<head>" 
		p 	"		<title>LCBO Connoisseur</title>"
		p   "	</head>"
		p 	"</body>"
	## Then I need to give this content a title. We'll call it Index of Products
		p "<h1> Index of Products </h1> "
	## After that, I need to bring in the parsed index information

	parsed_index = pull_data("http://lcboapi.com/products")

	## Then I gotta loop through each item in the array and output the information.

		parsed_index.each do |drink|
			#Put the name of the drink as an html subhead and separate div tag
			p "<div class = 'drink'>"
			p "<h2>#{drink['name']}</h2>"
			#Put info for the drink. Price and origin
			p "<ul>"
			p "<li>#{drink['origin']}</li>"
			p "<li>$#{"%.2f" % (drink['price_in_cents'].to_f / 100)}</p>"
			p "<ul>"
			p "</div>"
	    end

	## Then I gotta add an html footer
	html_footer
	end

	def pull_data(url)
		raw_data = open(url).read
		parsed_data = JSON.parse(raw_data)

		return parsed_data['result']


		#pager_info = parsed_data['pager']

		#until pager_info['records_per_page']

		#puts parsed_data['pager["records_per_page"]']
					#puts parsed_data['result']
	end

	def show(product_id)

	## Show needs to display the features from the product ID that has been entered.
	## To prove that this has worked, we'll use the ID 00681, and that should return
	## the information for Coors Light. 
		
	end

	def html_header
		##Outline the basic html header information
	end

	def html_footer
		##Outline the basic html footer information
	end
end

generator = HtmlGenerator.new
generator.index
#generator.pull_data("http://lcboapi.com/products")


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
