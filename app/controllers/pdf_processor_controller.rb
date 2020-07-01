class PdfProcessorController < ApplicationController
  ## Isaac and Erena will drive the implementation
  # of this class
  def new
  end

  def process_pdf
    # This is where the action happens.
    # The uploaded file and the relevant metadata will
    # be passed to the backend processing class.

    ### This class will need to be updated to take
    # in the uploaded file and metadata
    pdf_processor = PdfProcessor.new
  end
end
