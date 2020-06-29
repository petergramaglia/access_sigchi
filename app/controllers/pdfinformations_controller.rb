require "prawn"
class PdfinformationsController < ApplicationController
	def download_pdf
		send_data generate_pdf(),
              filename: "created.pdf",
              type: "application/pdf"
	end

	def upload_pdf
		file_field = params['file'] rescue nil
		# # file_field is a StringIO object
		file_field.content_type # 'text/csv'
		puts file_field.full_original_filename
		# puts "hello"
	end

	private 
		def generate_pdf
			Prawn::Document.new do
				text "Hello, world!"
		        text "TEST PDF"
     		end.render
		end
end
