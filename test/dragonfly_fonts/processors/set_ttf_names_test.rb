require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetTtfNames do

      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::SetTtfNames.new }
      let(:font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }

      let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

      it 'sets designer' do
        processor.call(font, { designer: 'John Doe' })
        analyser.call(font)['designer'].must_equal 'John Doe'
      end

      it 'sets license_url' do
        processor.call(font, { license_url: 'http://www.google.com' })
        analyser.call(font)['license_url'].must_equal 'http://www.google.com'
      end

    end
  end
end