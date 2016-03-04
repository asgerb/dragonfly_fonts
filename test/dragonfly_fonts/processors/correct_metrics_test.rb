require 'test_helper'

module DragonflyFonts
  module Processors
    describe CorrectMetrics do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      # =====================================================================

      it 'adjusts ascent value' do
        skip 'need to find font that is changed by this'
        asset.correct_metrics.font_info.must_equal '…'
      end

      it 'adjusts descent value' do
        skip 'need to find font that is changed by this'
        asset.correct_metrics.font_info.must_equal '…'
      end
    end
  end
end
