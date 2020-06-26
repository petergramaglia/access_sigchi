require "prawn"
class PdfinformationsController < ApplicationController
	def download_pdf
		send_data generate_pdf(),
              filename: "created.pdf",
              type: "application/pdf"
	end

	private 
		def generate_pdf
			Prawn::Document.new do
				text "Hello, world!"
		        text "TEST PDF"
     		end.render
		end
end
