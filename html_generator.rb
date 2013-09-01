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
		p 	"<head>" 
		p 	"<title>LCBO Connoisseur</title>"
		p   "</head>"
		p 	"</body>"
	## Then I need to give this content a title. We'll call it Index of Products
		p "<h1> Index of Products </h1> "
	## After that, I need to bring in the parsed index information
	parsed_index = pull_data

	## Then I gotta loop through each item in the array and output the information.

		parsed_index.each do |drink|
			#Put the name of the drink as an html subhead and separate div tag
			p "<div class = 'drink'>"
			p "<h2></h2>"
			#Put the information of the drink... we'll just do name and origin for now.
			p "<p>#{name}</p>"
			p "<p>#{tags}</p>"
			p "</div>"
	    end

	## Then I gotta add an html footer
	html_footer
	end

	def pull_data
		raw_data = open("http://lcboapi.com/products").read
		parsed_data = JSON.parse(raw_data)

		return parsed_data

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