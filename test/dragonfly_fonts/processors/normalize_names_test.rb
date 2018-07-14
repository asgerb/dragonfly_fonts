require 'test_helper'

describe DragonflyFonts::Processors::NormalizeNames do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.ttf') }

  # TODO: how to test?

  it { content.normalize_names.mime_type.must_equal 'font/ttf' }

  describe 'tempfile has extension' do
    it { content.normalize_names.tempfile.path.must_match /\.ttf\z/ }
  end
end
