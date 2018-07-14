require 'test_helper'

describe DragonflyFonts::Processors::SetDimensions do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('sample.otf') }

  let(:ascent) { 10 }
  let(:descent) { 10 }

  before do
    @original_ascent = content.font_info['ascent']
    @original_descent = content.font_info['descent']
  end

  it { content.set_dimensions(ascent: ascent).font_info['ascent'].wont_equal @original_ascent }
  it { content.set_dimensions(descent: descent).font_info['descent'].wont_equal @original_descent }

  describe 'tempfile has extension' do
    it { content.set_dimensions(ascent: ascent, descent: descent).tempfile.path.must_match /\.otf\z/ }
  end
end
