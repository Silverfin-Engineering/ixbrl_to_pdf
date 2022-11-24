# frozen_string_literal: true

module IxbrlToPdf
  class ItextConverter
    def self.call(file:)
      Kernel.system(
        'java',
        '-cp',
        'script/ixbrl_to_pdf/.:script/ixbrl_to_pdf/core-renderer.jar:script/ixbrl_to_pdf/iText-2.0.8.jar',
        'ConvertToPdf',
        file.path
      )
    end
  end
end
