require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetWidth do
      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::SetWidth.new }

      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:glyph) { 'A' }
      let(:analyser) { DragonflyFonts::Analysers::Bbox.new }

      describe 'relative=0' do
        it 'sets the width to the value' do
          skip 'bbox does not reflect the changes'
          processor.call(font, 200, 0)
        end
      end

      describe 'relative=1' do
        it 'increments the width by the value' do
          skip 'bbox does not reflect the changes'
          processor.call(font, 200, 1)
        end
      end

      describe 'relative=2' do
        it 'scales width by the value/100' do
          skip 'bbox does not reflect the changes'
          processor.call(font, 200, 2)
        end
      end
    end
  end
end
