require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetDimensions do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:ascent) { 200 }
      let(:descent) { -200 }

      let(:original_ascent) { asset.font_info['ascent'] }
      let(:original_descent) { asset.font_info['descent'] }

      # =====================================================================

      describe 'upos' do
        it 'sets the width to the value' do
          skip 'somehow the :font_info does not seem to report correct values'
          asset.set_dimensions(ascent: ascent).font_info['ascent'].must_equal (original_ascent + ascent)
          asset.set_dimensions(descent: descent).font_info['descent'].must_equal (original_descent + descent)
        end
      end
    end
  end
end
