require 'hexapdf'
class MetadataController < ApplicationController
    def display
        doc = HexaPDF::Document.open('app/models/concerns/accessible.pdf')

        doc = open_pdf
        @metadata = doc.value
    end

    def create
        doc = HexaPDF::Document.open('app/models/concerns/accessible.pdf')
        
        doc = open_pdf
        doc.value = params[:edited].to_unsafe_h
        doc.write('modified.pdf')
    end

    def open_pdf
        HexaPDF::Document.open('app/models/concerns/accessible.pdf').trailer.info
    end

end