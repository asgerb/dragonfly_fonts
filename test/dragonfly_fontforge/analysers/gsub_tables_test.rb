require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe 'GsubTables' do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::GsubTables.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
        it 'returns Array' do
          analyser.call(font).must_be_kind_of Array
        end

        it 'includes info, subtables, name' do
          analyser.call(font).map(&:keys).uniq.flatten.must_equal %w(info subtables name)
        end

        describe 'info' do
          it 'is an Array' do
            analyser.call(font).shuffle.first['info'].must_be_kind_of Array
          end
        end

        describe 'subtables' do
          it 'is an Array' do
            analyser.call(font).shuffle.first['subtables'].must_be_kind_of Array
          end
          it 'has glyphs and name keys' do
            analyser.call(font).shuffle.first['subtables'].shuffle.first.keys.must_equal %w(glyphs name)
          end
        end

        describe 'name' do
          it 'is a String' do
            analyser.call(font).shuffle.first['name'].must_be_kind_of String
          end
        end
      end

    end
  end
end