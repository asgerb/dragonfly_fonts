require 'test_helper'

module DragonflyFontforge
  describe Plugin do

    let(:app) { test_app.configure_with(:fontforge) }
    let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

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
    end

  end
end