# Dragonfly Fonts

Wraps common font-related tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Dependencies

* [FontForge](http://fontforge.github.io)

## Todo

* add EOT support
* add WOFF2 support
* add TTF autohint

see https://github.com/zoltan-dulac/css3FontConverter

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_fonts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_fonts

You will also need FontForge with Python extensions installed. 

Using [Homebrew](http://brew.sh):

    $ brew install fontforge --enable-pyextension

Using debian/ubuntu packages:

    $ sudo apt-get install fontforge python-fontforge

## Usage

Add the `:fonts` plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin :fonts
end
```

## Analysers

### Bbox

Returns `Struct.new("Bbox", :glyph, :min_x, :min_y, :max_x, :max_y, :width, :height)` representing the glyph's bounding box.

```ruby
font.bbox(glyph)
```

### Font Info

Returns information about the font as a Hash with the following keys: `:ascent`, `:cap_height`, `:comment`, `:copyright`, `:default_base_filename`, `:descent`, `:descriptor`, `:designer`, `:designer_url`, `:em`, `:embedding_restrictions`, `:encoding`, `:familyname`, `:fontlog`, `:fontname`, `:fullname`, `:license`, `:license_url`, `:path`, `:sfnt_revision`, `:trademark`, `:upos`, `:uwidth`, `:vendor_url`, `:version`, `:weight`, `:woff_metadata`, `:woff_revision`, `:x_height`.

```ruby
font.font_info
```

### Glyphs

Returns `Array` of all glyphs contained in the font, each glyph represented by a Hash with the following keys: `:glyphclass`, `:glyphname`, `:encoding`, `:script`, `:width`, `:unicode`.

```ruby
font.glyphs
```

### GSUB Tables

Returns `Array` of gsub tables in the font.

```ruby
font.gsub_tables
```

## Processors

### Correct Metrics

### Encode

### Extract Glyph

### Set TTF Names

### Set Width

### Set WOFF Metadata

## Contributing

1. Fork it ( https://github.com/tomasc/dragonfly_fonts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request