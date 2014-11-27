require 'dragonfly'
require 'dragonfly_fontforge/plugin'
require 'dragonfly_fontforge/version'

Dragonfly.app.configure do
  plugin :fontforge
end
