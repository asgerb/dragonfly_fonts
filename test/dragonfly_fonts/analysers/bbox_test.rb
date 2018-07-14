require 'test_helper'

describe DragonflyFonts::Analysers::Bbox do
  let(:app) { test_app.configure_with(:fonts) }
  let(:analyser) { DragonflyFonts::Analysers::Bbox.new }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  let(:bbox) { analyser.call(content, 'A') }

  it { bbox.must_be_kind_of Struct }
  it { bbox.glyph.must_equal 'A' }
  it { bbox.min_x.must_equal 16 }
  it { bbox.min_y.must_equal(0) }
  it { bbox.max_x.must_equal 484 }
  it { bbox.max_y.must_equal 634 }
  it { bbox.width.must_equal 468 }
  it { bbox.height.must_equal 634 }
end
