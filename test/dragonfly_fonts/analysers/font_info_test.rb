require 'test_helper'

describe DragonflyFonts::Analysers::FontInfo do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('Inconsolata.otf')) }
  let(:analyser) { DragonflyFonts::Analysers::FontInfo.new }

  it { analyser.call(content).must_be_kind_of Hash }

  %w[ ascent
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
      license
      license_url
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
  it { analyser.call(content)['fullname'].must_equal 'Inconsolata' }
  it { analyser.call(content)['weight'].must_equal 'Medium' }
end
