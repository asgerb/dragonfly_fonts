require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe 'Glyphs' do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::Glyphs.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
        it 'returns Array' do
          analyser.call(font).must_be_kind_of Array
        end

        it 'includes standard Hash format' do
          analyser.call(font).shuffle.first.keys.must_equal %w(glyphclass glyphname encoding script width unicode)
        end
      end

    end
  end
end
