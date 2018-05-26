require 'test_helper'

describe DragonflyFonts::Processors::CorrectMetrics do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  # TODO: figure out how to test
  # it { content.correct_metrics.font_info.must_equal '…' }
  # it { content.correct_metrics.font_info.must_equal '…' }
end
