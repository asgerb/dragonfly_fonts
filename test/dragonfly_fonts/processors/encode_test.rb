require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }

  describe 'SUPPORTED_FORMATS' do
    DragonflyFonts::SUPPORTED_FORMATS.each do |format|
      unless File.exist?(SAMPLES_DIR.join("sample.#{format}"))
        it(format) { skip "sample.#{format} does not exist, skipping" }
        next
      end

      let(:content) { app.fetch_file SAMPLES_DIR.join("sample.#{format}") }
      it(format) do
        result = content.encode('otf')
        result.ext.must_equal 'otf'
        result.mime_type.must_equal 'font/otf'
        result.size.must_be :>, 0
      end
    end
  end

  describe 'SUPPORTED_OUTPUT_FORMATS' do
    DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |format|
      let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }
      it(format) do
        result = content.encode(format)
        result.ext.must_equal format
        result.mime_type.must_equal app.mime_types[".#{format}"]
        result.size.must_be :>, 0
      end
    end
  end
end
