require 'test_helper'

module DragonflyFonts
  module Analysers
    describe FontInfo do

      let(:app) { test_app.configure_with(:fonts) }
      let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }
      let(:font) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }

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
        
        it 'includes familyname' do
          analyser.call(font)['familyname'].must_equal 'Inconsolata'
        end

        it 'includes fullname' do
          analyser.call(font)['fullname'].must_equal 'Inconsolata'
        end

        it 'includes weight' do
          analyser.call(font)['weight'].must_equal 'Medium'
        end
      end

    end
  end
end
