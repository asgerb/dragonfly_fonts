require 'nokogiri'
require 'test_helper'

describe DragonflyFonts::Processors::FixDfltTable do
  let(:app) { test_app.configure_with(:fonts) }
  let(:asset) { app.fetch_file SAMPLES_DIR.join('Inconsolata.ttx') }

  let(:result) { asset.fix_dflt_table }
  let(:result_data) { Nokogiri::XML(result.data) }

  describe 'invalid check' do
    it 'considers data with LangSysRecord after ScriptTag[value="DFLT"] invalid' do
      asset.encode(:otf).ot_sanitise.encode('UTF-8').must_include "DFLT table doesn't satisfy the spec"
    end
  end

  it 'deletes any LangSysRecord tag under ttFont > GSUB > ScriptList > ScriptRecord[ScriptTag="DFLT"] > Script' do
    result_data.css('GSUB ScriptTag[value="DFLT"] + Script LangSysRecord').length.must_equal 0
  end

  it 'becomes valid' do
    result.encode(:otf).ot_sanitise.length.must_equal 0
  end
end
