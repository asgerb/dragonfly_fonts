require 'test_helper'

module DragonflyFonts
  module Analysers
    describe Bbox do
      let(:app) { test_app.configure_with(:fonts) }
      let(:analyser) { DragonflyFonts::Analysers::Bbox.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }

      describe 'call' do
        let(:bbox) { analyser.call(font, 'A') }

        it 'returns Hash' do
          bbox.must_be_kind_of Struct
        end

        it '#glyph' do
          bbox.glyph.must_equal 'A'
        end

        it '#min_x' do
          bbox.min_x.must_equal 14.6709
        end

        it '#min_y' do
          bbox.min_y.must_equal -0.863281
        end

        it '#max_x' do
          bbox.max_x.must_equal 483.28
        end

        it '#max_y' do
          bbox.max_y.must_equal 634.305
        end

        it '#width' do
          bbox.width.must_equal 468.60909999999996
        end

        it '#height' do
          bbox.height.must_equal 635.168281
        end
      end
    end
  end
end
