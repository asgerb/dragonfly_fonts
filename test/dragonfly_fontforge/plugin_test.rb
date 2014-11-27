require 'test_helper'

module DragonflyFontforge
  describe Plugin do

    let(:app) { test_app.configure_with(:fontforge) }
    let(:font){ app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

    describe 'analysers' do
      it 'should return list of glyphs'
    end

  end
end