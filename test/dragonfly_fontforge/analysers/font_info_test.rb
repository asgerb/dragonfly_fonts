require 'test_helper'

module DragonflyFontforge
  module Analysers
    describe FontInfo do

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
            cap_height
            comment
            copyright
            default_base_filename
            descent
            descriptor
            designer
            designer_url
            em
            embedding_restrictions
            encoding
            familyname
            fontlog
            fontname
            fullname
            license
            license_url
            path
            sfnt_revision
            trademark
            upos
            uwidth
            vendor_url
            version
            weight
            woff_metadata
            woff_revision
            x_height
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
