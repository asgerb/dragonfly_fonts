require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetUnderline do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:upos) { 1.0 }
      let(:uwidth) { 2.0 }

      # =====================================================================

      describe 'upos' do
        it 'sets the width to the value' do
          asset.set_underline(upos: upos).font_info['upos'].must_equal upos
          asset.set_underline(uwidth: uwidth).font_info['uwidth'].must_equal uwidth
        end
      end
    end
  end
end
