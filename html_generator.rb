require 'json'
require 'open-uri'

class HtmlGenerator
	def index

	## Index needs to display a list of products in html form.
	## Anything that's not related to the output should not be in this method.
		puts "HtmlGenerator: index"
		raw_response = open("http://lcboapi.com/products").read

		#Parse JSON-formatted text int oa Ruby Hash
		parsed_response = JSON.parse(raw_response)

		#Return the actual result data from the response, ignoring metadata
		products = parsed_response["result"]

		puts products
#		products.each do |item, value|
#			p "<li> #{item} </li>"
#		end
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