require 'test_helper'

module DragonflyFontforge
  module Processors
    describe Encode do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:processor) { DragonflyFontforge::Processors::Encode.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:analyser) { DragonflyFontforge::Analysers::FontInfo.new }

      it 'allows to convert to :woff' do
        processor.call(font, :woff).path.must_match(/woff\z/)
      end

    end
  end
end
