require 'test_helper'

describe DragonflyFonts::Plugin do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('sample.otf')) }

  describe 'analysers' do
    it { content.must_respond_to :bbox }
    it { content.must_respond_to :font_info }
    it { content.must_respond_to :glyphs }
    it { content.must_respond_to :gsub_tables }
    it { content.must_respond_to :ots_sanitize }
  end

  describe 'processors' do
    it { content.must_respond_to :correct_metrics }
    it { content.must_respond_to :encode }
    it { content.must_respond_to :extract_glyph }
    it { content.must_respond_to :fix_dflt_table }
    it { content.must_respond_to :normalize_names }
    it { content.must_respond_to :ots_sanitize! }
    it { content.must_respond_to :set_dimensions }
    it { content.must_respond_to :set_ttf_names }
    it { content.must_respond_to :set_underline }
    it { content.must_respond_to :set_width }
    it { content.must_respond_to :set_woff_metadata }
    it { content.must_respond_to :ttf_autohint }
    it { content.must_respond_to :web_friendly }
  end
end
