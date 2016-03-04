require 'test_helper'

module DragonflyFonts
  module Processors
    describe TtfAutohint do
      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::CorrectMetrics.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Arial.ttf')) }

      it 'adjusts ascent value' do
        processor.call(font)
        font.path.must_include 'ttf'
      end
    end
  end
end
