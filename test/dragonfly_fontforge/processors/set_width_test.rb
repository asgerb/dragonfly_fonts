require 'test_helper'

module DragonflyFontforge
  module Processors
    describe SetWidth do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:processor) { DragonflyFontforge::Processors::SetWidth.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }
      
      let(:glyph) { "A" }
      let(:analyser) { DragonflyFontforge::Analysers::Bbox.new }

      before do
        @orig_width = analyser.call(font, glyph).width
      end

      describe 'relative=0' do
        it 'sets the width to the value' do
          processor.call(font, 200, 0)
          analyser.call(font, glyph).width.must_equal 200
        end
      end

      describe 'relative=1' do
        it 'increments the width by the value' do
          processor.call(font, 200, 1)
          analyser.call(font, glyph).width.must_equal @orig_width+200
        end
      end

      describe 'relative=2' do
        it 'scales width by the value/100' do
          processor.call(font, 200, 2)
          analyser.call(font, glyph).width.must_equal @orig_width*200/100
        end
      end

    end
  end
end
