require 'hexapdf'
class PdfProcessor

  def initialize(original_pdf, new_metadata_hash)
    puts "=" * 20
    puts original_pdf
    puts new_metadata_hash
    puts "=" * 20
    #@doc = original_pdf.values[0].open
    @original_pdf = original_pdf
    @new_metadata_hash = new_metadata_hash
  end

  # def hexapdf
  #   @formatted_doc = HexaPDF::Document.new(io: @doc)
  #   return @formatted_doc
  # end

  def write(path)
    @formatted_doc = HexaPDF::Document.new(io: @original_pdf)
    puts "+" * 20
    puts @formatted_doc.trailer.info.value
    puts "+" * 20
    @formatted_doc.trailer.info.value = @new_metadata_hash
    @formatted_doc.write(path)
    
  end
end