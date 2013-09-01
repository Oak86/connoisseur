require 'json'
require 'open-uri'

## This purpose of this app is to output a fully generated HTML file based on the ARGV passed
## in through the router.
class HtmlGenerator
	def index
	## Index needs to display a list of products in html form.
	## Anything that's not related to the output should not be in this method.
	
	## First, an html header needs to be printed
	html_header =
		p 	"<html>"
		p 	"<head>" 
		p 	"<title>LCBO Connoisseur</title>"
		p   "</head>"
		p 	"</body>"
	## Then I need to give this content a title. We'll call it Index of Products
	p "<h1> Index of Products </h1> "
	## After that, I need to bring in the parsed index information
	parsed_index

	## Then I gotta loop through each item in the array and output the information.

		parsed_index.each do |drink|
			#Put the name of the drink as an html subhead and separate div tag
			#Put the information of the drink
	    end

	## Then I gotta add an html footer
	html_footer
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

	def pull_data
		#puts "HtmlGenerator: show"
		#raw_response = open("http://lcboapi.com/products").read

		#Parse JSON-formatted text int oa Ruby Hash
		#parsed_response = JSON.parse(raw_response)

		#Return the actual result data from the response, ignoring metadata
		#products = parsed_response["result"]

		#puts products


		raw_data = open("http://lcboapi.com/products").read
		parsed_data = JSON.parse(raw_data)

		return parsed_data
	end
end