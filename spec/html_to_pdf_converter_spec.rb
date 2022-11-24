# frozen_string_literal: true

require 'ixbrl_to_pdf'
require 'spec_helper'

RSpec.describe IxbrlToPdf::HtmlToPdfConverter do
  before do
    allow(Kernel).to receive(:system)
  end

  describe '#call' do
    let(:file) { Tempfile.new('test_file') }

    it 'calls system with the correct arguments' do
      described_class.call(file: file)

      expect(Kernel).to have_received(:system).with(
        'java',
        '-jar',
        'script/ixbrl_to_pdf/html2pdf-1.1.0-jar-with-dependencies.jar',
        file.path
      )
    end
  end
end
