require 'test_helper'

module DragonflyFonts
  module Processors
    describe ExtractGlyph do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:glyph) { 'A' }

      let (:processor) { DragonflyFonts::Processors::ExtractGlyph.new }

      # =====================================================================

      it 'extracts specified glyph in SVG by default' do
        asset.extract_glyph(glyph).data.must_include '</svg>'
      end

      describe 'format' do
        let (:url_attributes) { OpenStruct.new }

        it 'allows to specify format' do
          asset.extract_glyph(glyph, format: :svg).data.must_include '</svg>'
        end

        it 'updates the file ext to SVG by default' do
          asset.extract_glyph(glyph).ext.must_equal 'svg'
        end

        it 'updates the file meta format to SVG by default' do
          asset.extract_glyph(glyph).meta['format'].must_equal 'svg'
        end

        it 'updates the url extension to SVG by default' do
          processor.update_url(url_attributes, glyph)
          url_attributes.ext.must_equal 'svg'
        end
      end
    end
  end
end
