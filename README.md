# Dragonfly FontForge

Wraps common FontForge tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_fontforge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_fontforge

You will also need FontForge with Python extensions installed. 

Using [Homebrew](http://brew.sh):

    $ brew install fontforge --enable-pyextension

Using debian/ubuntu packages:

    $ sudo apt-get install fontforge python-fontforge

## Usage

Add the fontforge plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin DragonflyFontforge::Plugin.new
  # ...
end
```

Available analysers:

* `.bbox`
* `.font_info`
* `.glyphs`
* `.gsub_tables`

Available processors:

* `.correct_metrics`
* `.extract_glyph`
* `.set_ttf_names`
* `.set_width`
* `.set_woff_metadata`

## Contributing

1. Fork it ( https://github.com/tomasc/dragonfly_fontforge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
