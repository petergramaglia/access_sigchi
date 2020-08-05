class PdfProcessorController < ApplicationController
  def create
    @pdf_processor = PdfProcessor.new(@metadata.file)
    display_metadata
  end

  # After user inputs pdf, this function will update the available metadata
  # in the front end to all the metadata entries present in the given pdf.
  # Did not get this fully implemented by the end of Code for Good.
  def display_metadata
    @doc = @pdf_processor.hexapdf
    @metadata = @doc.trailer.info.value
  end

  # Updates information in PDF
  def update_pdf
    title = params[:title]
    author = params[:author]
    subject = params[:subject]
    tags = params[:tags]

    # Instead of individually assigning entries, it's much simpler to process
    # all entries as a single hash table. 
    new_metadata_hash = { Title: title, Author: author, Subject: subject, Tags: tags}

    original_pdf = params[:file].open # will blow up if no file submitted
    @pdf_processor = PdfProcessor.new(original_pdf, new_metadata_hash)

    modified_pdf = "#{Rails.root}/modified_pdf.pdf"
    @pdf_processor.write(modified_pdf)
    return send_file(modified_pdf)
  end
end