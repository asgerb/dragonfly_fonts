require 'test_helper'

describe DragonflyFonts::Processors::TtfAutohint do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.ttf') }

  # TODO: how to test this better?

  it { content.ttf_autohint.mime_type.must_equal 'font/ttf' }
end
