require 'test_helper'

module DragonflyFonts
  module Processors
    describe Encode do
      let(:app) { test_app.configure_with(:fonts) }
      let(:otf) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }
      let(:ttx) { app.fetch_file SAMPLES_DIR.join('Inconsolata.ttx') }

      # =====================================================================

      it 'allows to convert to :eot' do
        otf.encode(:eot).mime_type.must_equal 'application/vnd.ms-fontobject'
      end

      it 'allows to convert to :otf' do
        otf.encode(:otf).mime_type.must_equal 'application/vnd.oasis.opendocument.formula-template'
      end

      it 'allows to convert to :ttf' do
        otf.encode(:ttf).mime_type.must_equal 'application/octet-stream'
      end

      it 'allows to convert to :svg' do
        otf.encode(:svg).mime_type.must_equal 'image/svg+xml'
      end

      it 'allows to convert to :woff' do
        otf.encode(:woff).mime_type.must_equal 'application/font-woff'
      end

      it 'allows to convert to :woff2' do
        otf.encode(:woff2).data.must_match(/\AwOF2OTTO/)
      end

      it 'converts to :ttx' do
        otf.encode(:ttx).data.must_match(/\<ttFont sfntVersion="OTTO" ttLibVersion="\d+?\.\d+?"\>/)
      end

      it 'converts from to :ttx to :otf' do
        ttx.encode(:otf).mime_type.must_equal 'application/vnd.oasis.opendocument.formula-template'
      end
    end
  end
end
