require 'test_helper'

module DragonflyFonts
  module Processors
    describe Encode do

      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::Encode.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

      it 'allows to convert to :woff' do
        processor.call(font, :woff).path.must_match(/woff\z/)
      end

    end
  end
end
