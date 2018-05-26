require 'test_helper'

describe DragonflyFonts::Analysers::OtsSanitize do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('AppleGothic.ttf') }

  it { content.ots_sanitize.must_include "WARNING: bad range shift" }
end
