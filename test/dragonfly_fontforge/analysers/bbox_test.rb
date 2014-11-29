require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe Bbox do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::Bbox.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
        let(:bbox) { analyser.call(font, 'A') }

        it 'returns Hash' do
          bbox.must_be_kind_of Struct
        end

        it '#glyph' do
          bbox.glyph.must_equal 'A'
        end

        it '#min_x' do
          bbox.min_x.must_equal 25
        end

        it '#min_y' do
          bbox.min_y.must_equal 0
        end

        it '#max_x' do
          bbox.max_x.must_equal 613
        end

        it '#max_y' do
          bbox.max_y.must_equal 722
        end

        it '#width' do
          bbox.width.must_equal 588
        end

        it '#height' do
          bbox.height.must_equal 722
        end
      end

    end
  end
end