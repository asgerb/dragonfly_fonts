require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }
  let(:otf) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }
  let(:ttx) { app.fetch_file SAMPLES_DIR.join('Inconsolata.ttx') }

  describe 'otf' do
    it { otf.encode(:eot).mime_type.must_equal 'application/vnd.ms-fontobject' }
    it { otf.encode(:otf).mime_type.must_equal 'font/otf' }
    it { otf.encode(:ttf).mime_type.must_equal 'font/ttf' }
    it { otf.encode(:svg).mime_type.must_equal 'image/svg+xml' }
    it { otf.encode(:woff).mime_type.must_equal 'font/woff' }
    it { otf.encode(:woff2).mime_type.must_equal 'font/woff2' }

    it { otf.encode(:ttx).data.must_match(/\<ttFont sfntVersion="OTTO" ttLibVersion="\d+?\.\d+?"\>/) }
  end

  # describe 'ttx' do
  #   it { ttx.encode(:otf).mime_type.must_equal 'application/vnd.oasis.opendocument.formula-template' }
  # end
end
