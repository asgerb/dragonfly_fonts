require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetUnderline do
      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::SetUnderline.new }

      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      describe 'upos' do
        it 'sets the width to the value' do
          processor.call(font, upos: 1, uwidth: 1)
          font.path.must_include 'otf'
        end
      end
    end
  end
end
