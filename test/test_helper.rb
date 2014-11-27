require 'bundler/setup'

require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'dragonfly'
require 'dragonfly_fontforge'

# ---------------------------------------------------------------------

def test_app name=nil
  app = Dragonfly::App.instance(name)
  app.datastore = Dragonfly::MemoryDataStore.new
  app.secret = "test secret"
  app
end