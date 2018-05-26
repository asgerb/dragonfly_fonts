require 'test_helper'

describe DragonflyFonts::Processors::NormalizeNames do
  let(:app) { test_app.configure_with(:fonts) }
  let(:asset) { app.fetch_file SAMPLES_DIR.join('Arial.ttf') }

  # TODO: how to test?

  it { asset.normalize_names.mime_type.must_equal 'font/ttf' }
end
