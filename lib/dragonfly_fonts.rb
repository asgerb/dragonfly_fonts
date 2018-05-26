require 'dragonfly'
require 'dragonfly_fonts/plugin'
require 'dragonfly_fonts/unicode_ranges'
require 'dragonfly_fonts/version'

module DragonflyFonts
  class UnsupportedFormat < RuntimeError; end

  SCRIPT_DIR = Pathname.new(File.expand_path('../script', __dir__))

  FONT_FORGE_SUPPORTED_FORMATS = %w[bdf dfont bin hqx otf sfd pfa pfb cid ps svg ttf ttc pcf woff].freeze
  FONT_TOOLS_SUPPORTED_FORMATS = %w[ttx].freeze
  OT_SANITISE_SUPPORTED_FORMATS = %w[otf ttf woff woff2].freeze
  TTF_AUTOHINT_SUPPORTED_FORMATS = %w[ttf].freeze
  WOFF2_SUPPORTED_FORMATS = %w[woff2].freeze

  SUPPORTED_FORMATS = (
    FONT_FORGE_SUPPORTED_FORMATS +
    FONT_TOOLS_SUPPORTED_FORMATS +
    OT_SANITISE_SUPPORTED_FORMATS +
    TTF_AUTOHINT_SUPPORTED_FORMATS +
    WOFF2_SUPPORTED_FORMATS
  ).uniq.sort
end
