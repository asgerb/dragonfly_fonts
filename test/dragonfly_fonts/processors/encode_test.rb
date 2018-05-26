require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

  # DragonflyHarfbuzz::SUPPORTED_FORMATS.each do |format|
  #   describe format.to_s do
  #     let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join("sample.#{format}")) }
  #     before { processor.call(content, string) }
  #     it { content.ext.must_equal 'svg' }
  #     it { content.mime_type.must_equal 'image/svg+xml' }
  #   end
  # end

  DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |format|
    describe "output to #{format}" do
      it { content.encode(format).ext.must_equal format }
      it { content.encode(format).mime_type.must_equal app.mime_types[".#{format}"] }
    end
  end
end
