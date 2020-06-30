require 'hexapdf'
class MetadataController < ApplicationController
    def display
        doc = HexaPDF::Document.open('modified.pdf').trailer.info
        @metadata = doc.value
    end

    def create
        doc = HexaPDF::Document.open('modified.pdf')

        doc.trailer.info.value = params[:edited].to_unsafe_h
        doc.write('modified.pdf')
    end

    def open_pdf
        HexaPDF::Document.open('modified.pdf')
    end

end