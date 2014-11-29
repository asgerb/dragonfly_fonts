require 'dragonfly_fontforge/analysers/bbox'
require 'dragonfly_fontforge/analysers/font_info'
require 'dragonfly_fontforge/analysers/glyphs'
require 'dragonfly_fontforge/analysers/gsub_tables'

require 'dragonfly_fontforge/processors/correct_metrics'
require 'dragonfly_fontforge/processors/encode'
require 'dragonfly_fontforge/processors/extract_glyph'
require 'dragonfly_fontforge/processors/set_ttf_names'
require 'dragonfly_fontforge/processors/set_width'
require 'dragonfly_fontforge/processors/set_woff_metadata'

module DragonflyFontforge
  class Plugin

    def call app, opts={}
      app.add_analyser :bbox, Analysers::Bbox.new
      app.add_analyser :font_info, Analysers::FontInfo.new
      app.add_analyser :glyphs, Analysers::Glyphs.new
      app.add_analyser :gsub_tables, Analysers::GsubTables.new

      app.add_processor :correct_metrics, Processors::CorrectMetrics.new
      app.add_processor :encode, Processors::Encode.new
      app.add_processor :extract_glyph, Processors::ExtractGlyph.new
      app.add_processor :set_ttf_names, Processors::SetTtfNames.new
      app.add_processor :set_width, Processors::SetWidth.new
      app.add_processor :set_woff_metadata, Processors::SetWoffMetadata.new
    end

  end
end

Dragonfly::App.register_plugin(:fontforge) { DragonflyFontforge::Plugin.new }