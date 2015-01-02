require 'dragonfly_fonts/analysers/bbox'
require 'dragonfly_fonts/analysers/font_info'
require 'dragonfly_fonts/analysers/glyphs'
require 'dragonfly_fonts/analysers/gsub_tables'

require 'dragonfly_fonts/processors/correct_metrics'
require 'dragonfly_fonts/processors/encode'
require 'dragonfly_fonts/processors/extract_glyph'
require 'dragonfly_fonts/processors/set_ttf_names'
require 'dragonfly_fonts/processors/set_width'
require 'dragonfly_fonts/processors/set_woff_metadata'

module DragonflyFonts
  class Plugin

    def call app, opts={}
      app.add_analyser :bbox, Analysers::Bbox.new
      app.add_analyser :font_info, Analysers::FontInfo.new
      app.add_analyser :glyphs, Analysers::Glyphs.new
      app.add_analyser :gsub_tables, Analysers::GsubTables.new

      # ---------------------------------------------------------------------
      
      app.add_processor :correct_metrics, Processors::CorrectMetrics.new
      app.add_processor :encode, Processors::Encode.new
      app.add_processor :extract_glyph, Processors::ExtractGlyph.new
      app.add_processor :set_ttf_names, Processors::SetTtfNames.new
      app.add_processor :set_width, Processors::SetWidth.new
      app.add_processor :set_woff_metadata, Processors::SetWoffMetadata.new
    end

  end
end

Dragonfly::App.register_plugin(:fonts) { DragonflyFonts::Plugin.new }