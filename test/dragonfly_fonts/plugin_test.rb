require 'test_helper'

module DragonflyFonts
  describe Plugin do

    let(:app) { test_app.configure_with(:fonts) }
    let(:font) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }

    # ---------------------------------------------------------------------
    
    describe 'analysers' do
      it 'adds #bbox' do
        font.must_respond_to :bbox
      end

      it 'adds #font_info' do
        font.must_respond_to :font_info
      end

      it 'adds #glyphs' do
        font.must_respond_to :glyphs
      end

      it 'adds #gsub_tables' do
        font.must_respond_to :gsub_tables
      end
    end

    # ---------------------------------------------------------------------
    
    describe 'processors' do
      it 'adds #correct_metrics' do
        font.must_respond_to :correct_metrics
      end

      it 'adds #encode' do
        font.must_respond_to :encode
      end

      it 'adds #extract_glyph' do
        font.must_respond_to :extract_glyph
      end

      it 'adds #set_ttf_names' do
        font.must_respond_to :set_ttf_names
      end

      it 'adds #set_width' do
        font.must_respond_to :set_width
      end

      it 'adds #set_woff_metadata' do
        font.must_respond_to :set_woff_metadata
      end
    end

  end
end