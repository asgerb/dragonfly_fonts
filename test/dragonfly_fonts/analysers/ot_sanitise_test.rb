require 'test_helper'

module DragonflyFonts
  module Analysers
    describe OtSanitise do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('AppleGothic.ttf') }

      describe 'call' do
        it 'returns Array' do
          asset.ot_sanitise.must_include "WARNING: bad range shift"
        end
      end
    end
  end
end
