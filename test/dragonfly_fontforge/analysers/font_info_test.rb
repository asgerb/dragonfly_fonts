require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe 'FontInfo' do

      let(:app) { test_app.configure_with(:fontforge) }
      let(:analyser) { DragonflyFontforge::Analysers::FontInfo.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('fonts/FGroteskBook.otf')) }

      describe 'call' do
        it 'returns Hash' do
          analyser.call(font).must_be_kind_of Hash
        end

        it 'includes keys' do
          %w(
            ascent
            fontname
            fullname
            descent
            designer
            designer_url
            license
            license_url
            trademark
            vendor_url
            version
            weight
          ).each do |key|
            analyser.call(font).keys.must_include key
          end
        end
        
        it 'includes weight' do
          analyser.call(font)['weight'].must_equal 'Regular'
        end
      end

    end
  end
end
