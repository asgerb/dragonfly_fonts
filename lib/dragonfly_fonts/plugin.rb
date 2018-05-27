require 'dragonfly_fonts/analysers/bbox'
require 'dragonfly_fonts/analysers/font_info'
require 'dragonfly_fonts/analysers/glyphs'
require 'dragonfly_fonts/analysers/gsub_tables'
require 'dragonfly_fonts/analysers/ots_sanitize'

require 'dragonfly_fonts/processors/correct_metrics'
require 'dragonfly_fonts/processors/encode'
require 'dragonfly_fonts/processors/extract_glyph'
require 'dragonfly_fonts/processors/fix_dflt_table'
require 'dragonfly_fonts/processors/normalize_names'
require 'dragonfly_fonts/processors/ots_sanitize'
require 'dragonfly_fonts/processors/set_dimensions'
require 'dragonfly_fonts/processors/set_ttf_names'
require 'dragonfly_fonts/processors/set_underline'
require 'dragonfly_fonts/processors/set_width'
require 'dragonfly_fonts/processors/set_woff_metadata'
require 'dragonfly_fonts/processors/ttf_autohint'
require 'dragonfly_fonts/processors/web_friendly'

module DragonflyFonts
  class Plugin
    def call(app, options = {})
      app.add_analyser :bbox, Analysers::Bbox.new
      app.add_analyser :font_info, Analysers::FontInfo.new
      app.add_analyser :glyphs, Analysers::Glyphs.new
      app.add_analyser :gsub_tables, Analysers::GsubTables.new
      app.add_analyser :ots_sanitize, Analysers::OtsSanitize.new

      app.add_processor :correct_metrics, Processors::CorrectMetrics.new
      app.add_processor :extract_glyph, Processors::ExtractGlyph.new
      app.add_processor :fix_dflt_table, Processors::FixDfltTable.new
      app.add_processor :normalize_names, Processors::NormalizeNames.new
      app.add_processor :ots_sanitize!, Processors::OtsSanitize.new
      app.add_processor :set_dimensions, Processors::SetDimensions.new
      app.add_processor :set_ttf_names, Processors::SetTtfNames.new
      app.add_processor :set_underline, Processors::SetUnderline.new
      app.add_processor :set_width, Processors::SetWidth.new
      app.add_processor :set_woff_metadata, Processors::SetWoffMetadata.new
      app.add_processor :ttf_autohint, Processors::TtfAutohint.new
      app.add_processor :web_friendly, Processors::WebFriendly.new

      app.add_processor :encode do |content, format, options = {}|
        case content.ext
        when 'ttx'
          # when ttf pre-convert to otf
          Processors::Encode.new.call(content, 'otf', options) unless %w[font/ttf font/otf].include?(content.mime_type)
        when 'woff2'
          # when woff2 pre-convert to ttf
          Processors::Encode.new.call(content, 'ttf', options)
        end

        case format
        when 'eot'
          # when converting to eot supply ttf
          Processors::Encode.new.call(content, 'ttf', options) unless %w[font/ttf].include?(content.mime_type)
        when 'woff2'
          # when converting to woff2 supply otf
          Processors::Encode.new.call(content, 'otf', options) unless %w[font/ttf font/otf].include?(content.mime_type)
        end

        Processors::Encode.new.call(content, format, options)
      end

      app.add_mime_type 'ttf', 'font/ttf'
      app.add_mime_type 'otf', 'font/otf'
      app.add_mime_type 'woff', 'font/woff'
      app.add_mime_type 'woff2', 'font/woff2'
      app.add_mime_type 'ttx', 'font/ttx'
    end
  end
end

Dragonfly::App.register_plugin(:fonts) { DragonflyFonts::Plugin.new }
