require 'test_helper'

describe DragonflyFonts::Processors::SetDimensions do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  let(:ascent) { 25 }
  let(:descent) { 25 }

  before do
    @original_ascent = content.font_info['ascent']
    @original_descent = content.font_info['descent']
  end

  it { content.set_dimensions(ascent: ascent).font_info['ascent'].must_equal (@original_ascent + ascent) }
  it { content.set_dimensions(descent: descent).font_info['descent'].must_equal (@original_descent + descent) }

  describe 'tempfile has extension' do
    it { content.set_dimensions(ascent: ascent, descent: descent).tempfile.path.must_match /\.otf\z/ }
  end
end
