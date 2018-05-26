require 'nokogiri'
require 'test_helper'

describe DragonflyFonts::Processors::FixDfltTable do
  let(:app) { test_app.configure_with(:fonts) }
  let(:content) { app.fetch_file SAMPLES_DIR.join('Inconsolata.ttx') }

  let(:result) { content.fix_dflt_table }
  let(:result_data) { Nokogiri::XML(result.data) }

  describe 'invalid check' do
    it 'considers data with LangSysRecord after ScriptTag[value="DFLT"] invalid' do
      skip 'FIXME: encoding problems on linux'
      content.encode(:otf).ot_sanitise.encode('UTF-8').must_include "DFLT table doesn't satisfy the spec"
    end
  end

  it 'deletes any LangSysRecord tag under ttFont > GSUB > ScriptList > ScriptRecord[ScriptTag="DFLT"] > Script' do
    result_data.css('GSUB ScriptTag[value="DFLT"] + Script LangSysRecord').length.must_equal 0
  end

  it 'becomes valid' do
    skip 'FIXME'
    result.encode(:otf).ot_sanitise.length.must_equal 0
  end
end
