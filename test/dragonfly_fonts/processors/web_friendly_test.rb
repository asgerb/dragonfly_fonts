require 'test_helper'

module DragonflyFonts
  module Processors
    describe WebFriendly do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Arial.ttf') }

      # =====================================================================

      # TODO: how to test this?

      it 'works' do
        asset.web_friendly.mime_type.must_equal 'application/octet-stream'
      end
    end
  end
end
