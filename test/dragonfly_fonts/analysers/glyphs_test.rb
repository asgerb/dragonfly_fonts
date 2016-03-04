require 'test_helper'

module DragonflyFonts
  module Analysers
    describe Glyphs do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:glyph_A) { asset.glyphs.find{ |g| g['glyphname'] == 'A' } }

      describe 'call' do
        it 'returns Array' do
          asset.glyphs.must_be_kind_of Array
        end

        it 'returns properties per each glyph' do
          glyph_A['glyphclass'].wont_be_nil
          glyph_A['glyphname'].wont_be_nil
          glyph_A['encoding'].wont_be_nil
          glyph_A['script'].wont_be_nil
          glyph_A['width'].wont_be_nil
          glyph_A['unicode'].wont_be_nil
        end
      end
    end
  end
end
