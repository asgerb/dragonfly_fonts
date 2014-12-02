require 'test_helper'

module DragonflyFonts
  module Analysers
    describe Glyphs do

      let(:app) { test_app.configure_with(:fonts) }
      let(:analyser) { DragonflyFonts::Analysers::Glyphs.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }

      describe 'call' do
        it 'returns Array' do
          analyser.call(font).must_be_kind_of Array
        end

        it 'includes standard Hash format' do
          analyser.call(font).shuffle.first.keys.must_equal %w(glyphclass glyphname encoding script width unicode)
        end
      end

    end
  end
end
