require 'test_helper'

module DragonflyFontforge
  module Processors
    describe ExtractGlyph do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:processor) { DragonflyFontforge::Processors::ExtractGlyph.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:glyph) { 'A' }

      it 'extracts specified glyph in SVG by default' do
        processor.call(font, glyph).path.split('.').last.must_equal 'svg'
      end

      it 'allows to specify format' do
        processor.call(font, glyph, { format: :svg }).path.split('.').last.must_equal 'svg'
      end

    end
  end
end
