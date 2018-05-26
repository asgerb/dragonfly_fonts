require 'test_helper'

describe DragonflyFonts::Analysers::GsubTables do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }
  let(:analyser) { DragonflyFonts::Analysers::GsubTables.new }

  it { analyser.call(content).must_be_kind_of Array }

  # FIXME: Inconsolata does not have these tables, therefore not possible to test
  # it { analyser.call(content).must_equal %w(info subtables name) }
  # it { analyser.call(content).shuffle.first['info'].must_be_kind_of Array }
  # it { analyser.call(content).shuffle.first['subtables'].must_be_kind_of Array }
  # it { analyser.call(content).shuffle.first['subtables'].shuffle.first.keys.must_equal %w(glyphs name) }
  # it { analyser.call(content).shuffle.first['name'].must_be_kind_of String }
end
