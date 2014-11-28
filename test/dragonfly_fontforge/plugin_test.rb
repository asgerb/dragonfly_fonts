require 'test_helper'

module DragonflyFontforge
  describe Plugin do

    let(:app) { test_app.configure_with(:fontforge) }
    let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

    # ---------------------------------------------------------------------
    
    describe 'analysers' do
      it 'adds #font_info' do
        font.must_respond_to :font_info
      end

      it 'adds #glyphs' do
        font.must_respond_to :glyphs
      end
    end

    # ---------------------------------------------------------------------
    
    describe 'processors' do
    end

  end
end