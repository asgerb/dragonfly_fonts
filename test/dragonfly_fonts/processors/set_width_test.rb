require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetWidth do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:analyser) { DragonflyFonts::Analysers::Bbox.new }

      let(:glyph) { 'A' }
      let(:default_bbox) { analyser.call(asset, glyph) }

      let(:width) { 200 }

      let(:bbox) { analyser.call(asset.set_width(width, relative), glyph) }

      # =====================================================================

      describe 'relative=0' do
        let(:relative) { 0 }

        it 'sets the width to the value' do
          skip 'bbox does not reflect the changes'
          bbox.width.must_equal width.to_f
        end
      end

      describe 'relative=1' do
        let(:relative) { 1 }

        it 'increments the width by the value' do
          skip 'bbox does not reflect the changes'
          bbox.width.must_equal default_bbox.width + width.to_f
        end
      end

      describe 'relative=2' do
        let(:relative) { 2 }

        it 'scales width by the value/100' do
          skip 'bbox does not reflect the changes'
          bbox.width.must_equal default_bbox.width * width / 100.0
        end
      end
    end
  end
end
