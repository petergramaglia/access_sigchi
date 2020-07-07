require 'hexapdf'
class PdfProcessor

  def initialize(original_pdf)
    @doc = original_pdf.values[0].open
  end

  def hexapdf
    @formatted_doc = HexaPDF::Document.new(io: @doc)
    return @formatted_doc
  end

  def write 
    @formatted_doc.trailer.info.value = params[:edited].to_unsafe_h
    @formatted_doc.write('modified.pdf')
  end
end