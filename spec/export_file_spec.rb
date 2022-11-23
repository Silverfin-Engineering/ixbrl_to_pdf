# frozen_string_literal: true

require 'spec_helper'
require 'ixbrl_to_pdf/export_file'
require 'tempfile'
require 'securerandom'

RSpec.describe IxbrlToPdf::ExportFile do
  let!(:temp_file) { Tempfile.open([SecureRandom.uuid, '.html']) }

  let(:export_file_instance) do
    {
      'content' => 'some content',
      'file_name' => 'some-file-name.html'
    }
  end

  let(:export_file_instance_id) { 'some-id ' }
  let(:company_id) { 'company-id' }
  let(:period_id) { 'period-id' }

  let(:api) { double(:api, get_export_file_instance: export_file_instance) }

  subject do
    described_class.new(
      export_file_instance_id: export_file_instance_id,
      company_id: company_id,
      period_id: period_id,
      api: api
    )
  end

  before do
    allow(Tempfile).to receive(:new) do
      temp_file
    end
  end

  describe '#path' do
    it 'returns the path to the underlying file' do
      expect(subject.path).to eq(temp_file.path)
    end
  end

  describe 'the content of the underlying file' do
    it 'writes the content from the export file instance to the underlying file' do
      subject.path

      expect(export_file_instance['content']).to eq('some content')
      expect(temp_file.open.read).to eq(export_file_instance['content'])
      expect(api).to have_received(:get_export_file_instance).with(
        company_id: company_id,
        period_id: period_id,
        export_file_instance_id: export_file_instance_id
      )
    end
  end

  describe '#pdf_name' do
    it 'returns the file name without the pdf extension' do
      expect(subject.pdf_name).to eq(export_file_instance['file_name'].ext('pdf'))
    end
  end
end
