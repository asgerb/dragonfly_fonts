# Dragonfly FontForge

Wraps common FontForge tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_fontforge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_fontforge

## Usage

Add the fontforge plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin DragonflyFontforge::Plugin.new
  # ...
end
```

You can then use the following analysers:

* `.bbox`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dragonfly_fontforge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
