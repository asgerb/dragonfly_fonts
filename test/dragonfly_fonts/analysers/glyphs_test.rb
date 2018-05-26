require 'test_helper'

describe DragonflyFonts::Analysers::Glyphs do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('Inconsolata.otf') }

  let(:glyph_A) { content.glyphs.find{ |g| g['glyphname'] == 'A' } }

  it { content.glyphs.must_be_kind_of Array }

  it { glyph_A['encoding'].must_equal 65 }
  it { glyph_A['glyphclass'].must_equal "baseglyph" }
  it { glyph_A['glyphname'].must_equal "A" }
  it { glyph_A['script'].must_equal "latn" }
  it { glyph_A['unicode'].must_equal 65 }
  it { glyph_A['width'].must_equal 500 }
end
