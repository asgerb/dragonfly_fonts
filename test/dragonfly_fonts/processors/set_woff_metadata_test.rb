require 'test_helper'
require 'nokogiri'

describe DragonflyFonts::Processors::SetWoffMetadata do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

  let(:uniqueid) { 'UNIQUEID' }
  let(:licensee_name) { 'John Doe' }

  let(:woff_meta) { Nokogiri::XML(content.set_woff_metadata(uniqueid, licensee_name).font_info['woff_metadata']) }

  it { woff_meta.xpath('//uniqueid').first.attribute('id').value.must_match(/\A#{uniqueid}/) }
  it { woff_meta.xpath('//licensee').first.attribute('name').value.must_equal licensee_name }
end
