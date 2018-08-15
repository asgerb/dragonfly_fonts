require 'test_helper'

describe DragonflyFonts::Analysers::FontInfo do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('sample.otf')) }
  let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

  it { analyser.call(content).must_be_kind_of Hash }

  %w[
    ascent
    cap_height
    comment
    copyright
    default_base_filename
    descent
    descriptor
    designer
    designer_url
    em
    embedding_restrictions
    encoding
    familyname
    fontlog
    fontname
    fullname
    hhea_ascent
    hhea_ascent_add
    hhea_descent
    hhea_descent_add
    hhea_linegap
    license
    license_url
    os2_codepages
    os2_family_class
    os2_fstype
    os2_panose
    os2_strikeypos
    os2_strikeysize
    os2_subxoff
    os2_subxsize
    os2_subyoff
    os2_subysize
    os2_supxoff
    os2_supxsize
    os2_supyoff
    os2_supysize
    os2_typoascent
    os2_typoascent_add
    os2_typodescent
    os2_typodescent_add
    os2_typolinegap
    os2_unicoderanges
    os2_use_typo_metrics
    os2_vendor
    os2_version
    os2_weight
    os2_weight_width_slope_only
    os2_width
    os2_winascent
    os2_winascent_add
    os2_windescent
    os2_windescent_add
    path
    sfnt_revision
    trademark
    upos
    uwidth
    vendor_url
    version
    weight
    woff_metadata
    woff_revision
    x_height
  ].each do |key|
    it { analyser.call(content).keys.must_include key }
  end

  it { analyser.call(content)['familyname'].must_equal 'Inconsolata' }
  it { analyser.call(content)['fullname'].must_equal 'Inconsolata Regular' }
  it { analyser.call(content)['weight'].must_equal 'Regular' }
end
