require 'test_helper'

describe DragonflyFonts::Processors::SetUnderline do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  let(:upos) { 1.0 }
  let(:uwidth) { 2.0 }

  it { content.set_underline(upos: upos).font_info['upos'].must_equal upos }
  it { content.set_underline(uwidth: uwidth).font_info['uwidth'].must_equal uwidth }
end
