require 'test_helper'

module DragonflyFonts
  module Processors
    describe OtSanitise do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      it "runs the 'ot-sanitise' tool" do
        skip 'not sure how to test this'
      end
    end
  end
end
