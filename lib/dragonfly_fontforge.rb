require 'dragonfly'
require 'dragonfly_fontforge/plugin'
require 'dragonfly_fontforge/version'

module DragonflyFontforge
  SCRIPT_DIR = Pathname.new(File.expand_path('../../script', __FILE__))
end

Dragonfly.app.configure do
  plugin :fontforge
end
