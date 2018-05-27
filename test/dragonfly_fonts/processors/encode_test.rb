require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }

  DragonflyFonts::SUPPORTED_FORMATS.each do |format|
    next p "sample.#{format} does not exist, skipping" unless File.exists?(SAMPLES_DIR.join("sample.#{format}"))
    describe format.to_s do
      let(:content) { app.fetch_file SAMPLES_DIR.join("sample.#{format}") }
      let(:result) { content.encode('otf') }
      it { result.ext.must_equal 'otf' }
      it { result.mime_type.must_equal 'font/otf' }
      it { result.size.must_be :>, 0 }
    end
  end

  DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |format|
    describe "output to #{format}" do
      let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }
      let(:result) { content.encode(format) }
      it { result.ext.must_equal format }
      it { result.mime_type.must_equal app.mime_types[".#{format}"] }
      it { result.size.must_be :>, 0 }
    end
  end
end
