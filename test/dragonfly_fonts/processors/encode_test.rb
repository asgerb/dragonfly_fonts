require 'test_helper'

module DragonflyFonts
  module Processors
    describe Encode do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      # =====================================================================

      it 'allows to convert to :eot' do
        asset.encode(:eot).mime_type.must_equal 'application/vnd.ms-fontobject'
      end

      it 'allows to convert to :otf' do
        asset.encode(:otf).mime_type.must_equal 'application/vnd.oasis.opendocument.formula-template'
      end

      it 'allows to convert to :ttf' do
        asset.encode(:ttf).mime_type.must_equal 'application/octet-stream'
      end

      it 'allows to convert to :svg' do
        asset.encode(:svg).mime_type.must_equal 'image/svg+xml'
      end

      it 'allows to convert to :woff' do
        asset.encode(:woff).mime_type.must_equal 'application/font-woff'
      end

      it 'allows to convert to :woff2' do
        asset.encode(:woff2).data.must_match /\AwOF2OTTO/
      end
    end
  end
end
