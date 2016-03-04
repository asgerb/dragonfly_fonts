require 'test_helper'

module DragonflyFonts
  module Processors
    describe SetTtfNames do
      let(:app) { test_app.configure_with(:fonts) }
      let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

      let(:designer) { 'John Doe' }
      let(:license_url) { 'http://www.google.com' }

      # =====================================================================

      it 'sets designer' do
        asset.set_ttf_names(designer: designer).font_info['designer'].must_equal designer
      end

      it 'sets license_url' do
        asset.set_ttf_names(license_url: license_url).font_info['license_url'].must_equal license_url
      end
    end
  end
end
