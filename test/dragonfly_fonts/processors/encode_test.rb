require 'test_helper'

module DragonflyFonts
  module Processors
    describe Encode do

      let(:app) { test_app.configure_with(:fonts) }
      let(:processor) { DragonflyFonts::Processors::Encode.new }
      
      let(:otf_font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Inconsolata.otf')) }
      let(:ttf_font) { Dragonfly::Content.new(app, SAMPLES_DIR.join('Arial.ttf')) }

      let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

      # =====================================================================

      it 'allows to convert to :eot' do
        processor.call(ttf_font, :eot)
        ttf_font.path.must_include 'eot'
      end 

      it 'allows to convert to :otf' do
        processor.call(otf_font, :otf)
        get_mime_type(otf_font.path).must_include 'application/vnd.ms-opentype'
      end      

      it 'allows to convert to :ttf' do
        processor.call(otf_font, :ttf)
        get_mime_type(otf_font.path).must_include 'application/x-font-ttf'
      end

      it 'allows to convert to :svg' do
        processor.call(otf_font, :svg)
        get_mime_type(otf_font.path).must_include 'image/svg+xml'
      end

      it 'allows to convert to :woff' do
        processor.call(otf_font, :woff)
        otf_font.path.must_include 'woff'
      end

      # ---------------------------------------------------------------------
      
      def get_mime_type file_path
        `file --mime-type #{file_path}`.gsub(/\n/, "")
      end

    end
  end
end
