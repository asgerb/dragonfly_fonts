require 'test_helper'

module DragonflyFonts
  module Processors
    describe ExtractGlyph do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:glyph) { 'A' }

      # =====================================================================

      it 'extracts specified glyph in SVG by default' do
        asset.extract_glyph(glyph).data.must_include '</svg>'
      end

      it 'allows to specify format' do
        asset.extract_glyph(glyph, format: :svg).data.must_include '</svg>'
      end
    end
  end
end
