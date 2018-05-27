require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }

  DragonflyFonts::SUPPORTED_FORMATS.each do |format|
    next unless File.exists?(SAMPLES_DIR.join("sample.#{format}"))
    describe format.to_s do
      let(:content) { app.fetch_file SAMPLES_DIR.join("sample.#{format}") }
      it do
        content.encode('otf').ext.must_equal 'otf'
        content.encode('otf').mime_type.must_equal 'font/otf'
        content.encode('otf').size.must_be :>, 0
      end
    end
  end

  DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |format|
    describe "output to #{format}" do
      let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }
      it do
        content.encode(format).ext.must_equal format
        content.encode(format).mime_type.must_equal app.mime_types[".#{format}"]
        content.encode(format).size.must_be :>, 0
      end
    end
  end
end
