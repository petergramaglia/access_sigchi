require "prawn"
class PdfinformationsController < ApplicationController
	def download_pdf
		send_data generate_pdf(),
              filename: "created.pdf",
              type: "application/pdf"
	end

	def upload_pdf
		file = params[:file]
		# byebug
		puts file.original_filename
		puts "hello"
	end

	def full_original_name
	end

	private 
		def generate_pdf
			Prawn::Document.new do
				text "Hello, world!"
		        text "TEST PDF"
     		end.render
		end
end
