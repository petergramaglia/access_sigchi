require 'hexapdf'

class MetadataController < ApplicationController

    def display
        doc = HexaPDF::Document.open('accessible.pdf')
        @metadata = doc.trailer.info.value
    end

    def create
        doc = HexaPDF::Document.open('accessible.pdf')
        
        doc.trailer.info.value = params[:edited].to_unsafe_h
        doc.write('modified.pdf')
    end
end