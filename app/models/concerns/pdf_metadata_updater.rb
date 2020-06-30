require 'hexapdf'
class PdfMetadataUpdater
    def self.initialize(file_name, metadata)
        @file_name = file_name

        doc = open_pdf
        doc.trailer.info.value
    end

    def create
        @doc.trailer.info.value = params[:edited].to_unsafe_h
        @doc.write('modified.pdf')
    end

    def open_pdf
        HexaPDF::Document.open('app/models/concerns/accessible.pdf')
    end

    def print_file_name
        puts @file_name
    end
end