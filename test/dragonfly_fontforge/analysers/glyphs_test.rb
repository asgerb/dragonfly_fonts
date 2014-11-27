require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe 'Glyphs' do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::Glyphs.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
        it 'returns list of glyphs' do
          analyser.call(font).must_equal %w(a)
        end
      end

    end
  end
end
