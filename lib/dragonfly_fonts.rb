require 'dragonfly'
require 'dragonfly_fonts/plugin'
require 'dragonfly_fonts/version'

module DragonflyFonts
  SCRIPT_DIR = Pathname.new(File.expand_path('../../script', __FILE__))
end

Dragonfly.app.configure do
  plugin :fonts
end
