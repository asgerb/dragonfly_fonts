require 'nokogiri'

module DragonflyFonts
  module Processors
    class FixDfltTable
      def call(content, _opts = {})
        doc = Nokogiri::XML(content.data)
        doc.css('GSUB ScriptTag[value="DFLT"] + Script LangSysRecord').remove
        content.update(doc.to_xml)
      end
    end
  end
end
