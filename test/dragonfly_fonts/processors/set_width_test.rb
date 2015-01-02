require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetWidth do

      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::SetWidth.new }

      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }
      
      let(:glyph) { "A" }
      let(:analyser) { DragonflyFonts::Analysers::Bbox.new }

      describe 'relative=0' do
        it 'sets the width to the value' do
          skip
          processor.call(font, 200, 0)
          analyser.call(font, glyph).width.must_equal 200
        end
      end

      describe 'relative=1' do
        it 'increments the width by the value' do
          skip
          processor.call(font, 200, 1)
          analyser.call(font, glyph).width.must_equal @orig_width+200
        end
      end

      describe 'relative=2' do
        it 'scales width by the value/100' do
          skip
          processor.call(font, 200, 2)
          analyser.call(font, glyph).width.must_equal @orig_width*200/100
        end
      end

    end
  end
end
