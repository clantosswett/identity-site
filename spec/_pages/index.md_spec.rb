require 'spec_helper'

RSpec.describe 'index.md' do
  let(:doc) { Nokogiri::HTML(file_at('/')) }

  it 'opens external links in a new window' do
    expect(doc).to open_external_links_in_new_window
  end

  it 'escapes html correctly' do
    expect(doc).to properly_escape_html
  end

  it 'links to valid internal pages' do
    expect(doc).to link_to_valid_internal_pages
  end

  it 'has valid links' do
    expect(doc).to link_to_valid_urls
  end

  it 'contains specific copy that NewRelic checks for' do
    expect(doc.text).to include('secure access to government services')
  end
end
