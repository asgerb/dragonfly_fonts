module DragonflyFontforge
  class Plugin

    def call app, opts={}
      
    end

  end
end

Dragonfly::App.register_plugin(:fontforge) { DragonflyFontforge::Plugin.new }