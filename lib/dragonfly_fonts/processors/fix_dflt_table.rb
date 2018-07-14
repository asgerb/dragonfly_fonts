require 'nokogiri'

module DragonflyFonts
  module Processors
    class FixDfltTable
      def call(content, options = {})
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)

        doc = Nokogiri::XML(content.data)
        doc.css('GSUB ScriptTag[value="DFLT"] + Script LangSysRecord').remove
        
        content.update(doc.to_xml)
      end
    end
  end
end
