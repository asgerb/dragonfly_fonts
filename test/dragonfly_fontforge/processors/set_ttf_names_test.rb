require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe 'SetTtfNames' do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::Glyphs.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
      end

    end
  end
end
