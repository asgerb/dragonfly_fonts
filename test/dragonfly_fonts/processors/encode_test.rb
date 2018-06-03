require 'test_helper'

describe DragonflyFonts::Processors::Encode do
  let(:app) { test_app.configure_with(:fonts) }

  DragonflyFonts::SUPPORTED_FORMATS.each do |format|
    unless File.exist?(SAMPLES_DIR.join("sample.#{format}"))
      it(format) { skip "sample.#{format} does not exist, skipping" }
      next
    end

    let(:content) { app.fetch_file SAMPLES_DIR.join("sample.#{format}") }

    DragonflyFonts::SUPPORTED_OUTPUT_FORMATS.each do |output_format|
      it("#{format} to #{output_format}") do
        result = content.encode(output_format)
        result.ext.must_equal output_format
        result.mime_type.must_equal app.mime_types[".#{output_format}"]
        result.size.must_be :>, 0
        result.tempfile.path.must_match /\.#{output_format}\z/
      end
    end
  end
end
