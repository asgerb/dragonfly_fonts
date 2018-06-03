require 'test_helper'

describe DragonflyFonts::Processors::WebFriendly do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.ttf') }

  # TODO: how to test this?

  it { content.web_friendly.mime_type.must_equal 'font/ttf' }

  describe 'tempfile has extension' do
    it { content.web_friendly.tempfile.path.must_match /\.ttf\z/ }
  end
end
