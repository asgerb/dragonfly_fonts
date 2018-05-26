require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }

  DragonflyFonts::SUPPORTED_FORMATS.each do |format|
    next unless File.exists?(SAMPLES_DIR.join("sample.#{format}"))
    describe format.to_s do
      let(:content) { app.fetch_file SAMPLES_DIR.join("sample.#{format}") }
      it { content.encode('otf').ext.must_equal 'otf' }
      it { content.encode('otf').mime_type.must_equal 'font/otf' }
      it { content.encode('otf').size.must_be :>, 0 }
    end
  end

  DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |format|
    describe "output to #{format}" do
      let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }
      it { content.encode(format).ext.must_equal format }
      it { content.encode(format).mime_type.must_equal app.mime_types[".#{format}"] }
      it { content.encode(format).size.must_be :>, 0 }
    end
  end
end
