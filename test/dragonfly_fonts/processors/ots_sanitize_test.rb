require 'test_helper'

describe DragonflyFonts::Processors::OtsSanitize do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  it "runs the 'ots-sanitize' tool" do
    skip 'not sure how to test this'
  end
end
