require 'test_helper'
require 'nokogiri'

module DragonflyFontforge
  module Processors
    describe SetWoffMetadata do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:processor) { DragonflyFontforge::Processors::SetWoffMetadata.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:uniqueid) { 'UNIQUEID' }
      let(:licensee_name) { 'John Doe' }
      let(:analyser) { DragonflyFontforge::Analysers::FontInfo.new }

      it 'converts to woff' do
        processor.call(font, uniqueid).path.split('.').last.must_equal 'woff'
      end

      describe 'values' do
        before do
          processor.call(font, uniqueid, licensee_name)

          @woff_meta = Nokogiri::XML(analyser.call(font)['woff_metadata'])
          @font_info = analyser.call(font)
        end

        it 'sets uniqueid' do
          @woff_meta.xpath('//uniqueid').first.attribute('id').value.must_match /\A#{uniqueid}/
        end

        it 'sets licensee' do
          @woff_meta.xpath('//licensee').first.attribute('name').value.must_equal licensee_name
        end
      end

    end
  end
end