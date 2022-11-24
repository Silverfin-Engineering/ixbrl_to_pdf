# frozen_string_literal: true

# Uses the html2pdf packaged jar file to convert HTMLs
# to PDFs
#
module IxbrlToPdf
  class HtmlToPdfConverter
    def self.call(file:)
      Kernel.system(
        'java',
        '-jar',
        'script/ixbrl_to_pdf/html2pdf-1.1.0-jar-with-dependencies.jar',
        file.path
      )
    end
  end
end
