class PdfProcessorController < ApplicationController
  def create
    # @pdf_processor = PdfProcessor.new(params[:pdf_processor])
    #puts @metadata.author
    @pdf_processor = PdfProcessor.new(@metadata.file)
    display_metadata
  end

  # After user inputs pdf, this function will update the available metadata
  # in the front end to all the metadata entries present in the given pdf.
  def display_metadata
    @doc = @pdf_processor.hexapdf
    @metadata = @doc.trailer.info.value
  end

  def update_pdf
    title = params[:title]
    author = params[:author]
    subject = params[:subject]
    tags = params[:tags]

    new_metadata_hash = { Title: title, Author: author, Subject: subject, Tags: tags}

    original_pdf = params[:file].open # will blow up if no file submitted

    @pdf_processor = PdfProcessor.new(original_pdf, new_metadata_hash)
    # # byebug
    # puts "uploading pdf"
    # puts pdf_processor.original_filename
    # puts title
    # puts author
    # puts subject
    # puts date
    # puts keywords

    # Instead of individually assigning entries, it's much simpler to process
    # all entries as a single hash table. This can be seen from the front
    # end in the 'controllers/metadata/display.html.erb' file. This function is 
    # updated to process updated metadata as a single ':edited' variable.

    # @metadata = params[:edited].to_unsafe_h
    

    #@metadata = params[:edited]
    #puts "HERE 1"
    #puts @metadata.title
    #create
    modified_pdf = "#{Rails.root}/modified_pdf.pdf"
    @pdf_processor.write(modified_pdf)
    return send_file(modified_pdf)
  end

  # private def pdf_processor_params
  #   params.require(:pdf_processor).permit(:file)
  # end
end