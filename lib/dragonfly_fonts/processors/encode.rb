require 'shellwords'

module DragonflyFonts
  module Processors
    class Encode
      def call(content, format, options = {})
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)

        format = format.to_s

        raise UnsupportedOutputFormat unless SUPPORTED_OUTPUT_FORMATS.include?(format)

        if content.mime_type == Rack::Mime.mime_type(".#{format}")
          content.ext ||= format
          content.meta['format'] = format
          return
        end

        content.shell_update(ext: format, escape: false) do |old_path, new_path|
          case
          when content.ext == 'woff2' && format == 'ttf' then woff2_decompress(old_path, new_path)
          when format == 'eot' then ttf2eot(old_path, new_path)
          when format == 'ttx' then fonttools(old_path, new_path)
          when format == 'woff2' then woff2_compress(old_path, new_path)
          else fontforge(old_path, new_path)
          end
        end

        content.meta['format'] = format
        content.ext = format
      end

      def update_url(attrs, format, _args = '')
        attrs.ext = format.to_s
      end

      private

      def fontforge(old_path, new_path)
        "#{fontforge_command} -lang=ff -c 'Open($1); Generate($2)' #{old_path} #{new_path}"
      end

      def fontforge_command
        'fontforge'
      end

      def fonttools(old_path, new_path)
        "#{fonttools_command} -o #{new_path} #{old_path}"
      end

      def fonttools_command
        'ttx'
      end

      def ttf2eot(old_path, new_path)
        "#{ttf2eot_command} < #{old_path} > #{new_path}"
      end

      def ttf2eot_command
        'ttf2eot'
      end

      def woff2_compress(old_path, new_path)
        temp_file = Tempfile.new(['font', '.woff2']).tap do |file|
          file.write(File.read(old_path))
        end
        "#{woff2_compress_command} #{temp_file.path} && mv #{temp_file.path.gsub(/\.\w{3,5}\z/, '.woff2')} #{new_path}"
      end

      def woff2_compress_command
        'woff2_compress'
      end

      def woff2_decompress(old_path, new_path)
        temp_file = Tempfile.new(['font', '.woff2']).tap do |file|
          file.write(File.read(old_path))
        end
        "#{woff2_decompress_command} #{temp_file.path} && mv #{temp_file.path.gsub(/\.\w{3,5}\z/, '.ttf')} #{new_path}"
      end

      def woff2_decompress_command
        'woff2_decompress'
      end
    end
  end
end
