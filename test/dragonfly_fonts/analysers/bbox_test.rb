require 'test_helper'

describe DragonflyFonts::Analysers::Bbox do
  let(:app) { test_app.configure_with(:fonts) }
  let(:analyser) { DragonflyFonts::Analysers::Bbox.new }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  let(:bbox) { analyser.call(content, 'A') }

  it { bbox.must_be_kind_of Struct }
  it { bbox.glyph.must_equal 'A' }
  it { bbox.min_x.must_equal 14.6709 }
  it { bbox.min_y.must_equal(-0.863281) }
  it { bbox.max_x.must_equal 483.28 }
  it { bbox.max_y.must_equal 634.305 }
  it { bbox.width.must_equal 468.60909999999996 }
  it { bbox.height.must_equal 635.168281 }
end
