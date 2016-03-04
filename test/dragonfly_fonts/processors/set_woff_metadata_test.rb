require 'test_helper'
require 'nokogiri'

module DragonflyFonts
  module Processors
    describe SetWoffMetadata do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:uniqueid) { 'UNIQUEID' }
      let(:licensee_name) { 'John Doe' }

      # =====================================================================

      describe 'values' do
        let(:woff_meta) { Nokogiri::XML(asset.set_woff_metadata(uniqueid, licensee_name).font_info['woff_metadata']) }

        it 'sets uniqueid' do
          woff_meta.xpath('//uniqueid').first.attribute('id').value.must_match /\A#{uniqueid}/
        end

        it 'sets licensee' do
          woff_meta.xpath('//licensee').first.attribute('name').value.must_equal licensee_name
        end
      end
    end
  end
end
