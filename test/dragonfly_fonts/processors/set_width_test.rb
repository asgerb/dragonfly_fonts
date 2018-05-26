require 'test_helper'

describe DragonflyFonts::Processors::SetWidth do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }
  let(:analyser) { DragonflyFonts::Analysers::Bbox.new }

  let(:glyph) { 'A' }

  before { @default_bbox = analyser.call(content, glyph) }

  let(:width) { 200 }

  let(:bbox) { analyser.call(content.set_width(width, relative), glyph) }

  # describe 'relative=0' do
  #   let(:relative) { 0 }
  #   it { bbox.width.must_equal width.to_f }
  # end
  #
  # describe 'relative=1' do
  #   let(:relative) { 1 }
  #   it { bbox.width.must_equal @default_bbox.width + width.to_f }
  # end
  #
  # describe 'relative=2' do
  #   let(:relative) { 2 }
  #   it { bbox.width.must_equal @default_bbox.width * width / 100.0 }
  # end
end
