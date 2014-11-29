# Dragonfly FontForge

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_fontforge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_fontforge

## Usage

Add the fontforge plugin to your Dragonfly config block:

```
Dragonfly.app.configure do
  plugin DragonflyFontforge::Plugin.new
  # ...
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dragonfly_fontforge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
