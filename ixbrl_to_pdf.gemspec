# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'ixbrl_to_pdf'
  s.version = '1.0.0'
  s.authors = ['Silverfin NV']
  s.description = 'iText Wrapper for converting iXRBLs to PDFs'
  s.summary = s.description
  s.required_ruby_version = '>=2.7'
  s.email = 'dev@getsilverfin.com'
  s.files = [
    'README.md',
    'lib/ixbrl_to_pdf/html_to_pdf_converter.rb',
    'lib/ixbrl_to_pdf/itext_converter.rb',
    'lib/ixbrl_to_pdf/export_file.rb',
    'lib/ixbrl_to_pdf/ext/string.rb',
    'lib/ixbrl_to_pdf.rb'
  ]
  s.homepage = 'http://www.silverfin.com'
  s.rubyforge_project = 'silverfin'
  s.metadata['rubygems_mfa_required'] = 'true'
end
