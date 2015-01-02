require 'test_helper'

module DragonflyFonts
  module Processors
    describe CorrectMetrics do

      let(:app) { test_app.configure_with(:fonts) }

      let(:processor) { DragonflyFonts::Processors::CorrectMetrics.new }
      let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      # =====================================================================
      
      it 'adjusts ascent value' do
        skip 'need to find font that is changed by this'
        processor.call(font)
      end

      it 'adjusts descent value' do
        skip 'need to find font that is changed by this'
        processor.call(font)
      end

    end
  end
end
