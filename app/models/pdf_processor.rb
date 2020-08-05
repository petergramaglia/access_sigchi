require 'hexapdf'
class PdfProcessor

  # Initialize PDF processor class instance
  def initialize(original_pdf, new_metadata_hash)
    @original_pdf = original_pdf
    @new_metadata_hash = new_metadata_hash
  end


  # Write new, updated PDF to the input filename 'path'
  def write(path)
    # Convert to HexaPDF format
    @formatted_doc = HexaPDF::Document.new(io: @original_pdf)

    # Set metadata (trailer.info.value) equal to hash of user inputs
    @formatted_doc.trailer.info.value = @new_metadata_hash

    # Write new doc to the path
    @formatted_doc.write(path)
  end
end