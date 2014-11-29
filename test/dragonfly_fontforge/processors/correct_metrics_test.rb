require 'test_helper'

module DragonflyFontforge
  module Processors
    describe CorrectMetrics do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:processor) { DragonflyFontforge::Processors::CorrectMetrics.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:analyser) { DragonflyFontforge::Analysers::FontInfo.new }

      before do
        @orig_ascent = analyser.call(font)['ascent']
        @orig_descent = analyser.call(font)['descent']
        processor.call(font)
      end

      it 'adjusts ascent value' do
        analyser.call(font)['ascent'].wont_equal @orig_ascent
      end

      it 'adjusts descent value' do
        analyser.call(font)['descent'].wont_equal @orig_descent
      end

    end
  end
end
