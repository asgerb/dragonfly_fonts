require 'test_helper'

describe DragonflyFonts::Processors::ExtractGlyph do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }
  let(:processor) { DragonflyFonts::Processors::ExtractGlyph.new }

  let(:glyph) { 'A' }

  it { content.extract_glyph(glyph).data.must_include '</svg>' }
  it { content.extract_glyph(glyph, format: :svg).data.must_include '</svg>' }
  it { content.extract_glyph(glyph).ext.must_equal 'svg' }
  it { content.extract_glyph(glyph).meta['format'].must_equal 'svg' }

  describe 'url' do
    let(:url_attributes) { OpenStruct.new }

    before { processor.update_url(url_attributes, glyph) }

    it { url_attributes.ext.must_equal 'svg' }
  end
end
