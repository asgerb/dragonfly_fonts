require 'test_helper'

module DragonflyFonts
  module Processors
    describe TtfAutohint do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Arial.ttf') }

      # =====================================================================

      # TODO: how to test this better?

      it 'works' do
        asset.ttf_autohint.mime_type.must_equal 'application/octet-stream'
      end
    end
  end
end
