require 'shellwords'

module DragonflyFonts
  module Processors
    class Encode

      class UnsupportedFormat < RuntimeError; end

      def call content, format
        content.shell_update(ext: format, escape: false) do |old_path, new_path|
          case format.to_sym
          when :eot then ttf2eot(old_path, new_path)
          when :otf, :svg, :ttf, :woff then fontforge(old_path, new_path)
          else raise UnsupportedFormat
          end
        end

        content.meta['format'] = format.to_s
        content.ext = format
      end

      def update_url attrs, format, args=""
        attrs.ext = format.to_s
      end

      private # =============================================================
      
      def fontforge old_path, new_path
        "#{fontforge_command} -lang=ff -c 'Open($1); Generate($2)' #{old_path} #{new_path}"
      end

      def fontforge_command
        'fontforge'
      end

      def ttf2eot old_path, new_path
        "#{ttf2eot_command} < #{old_path} > #{new_path}"
      end

      def ttf2eot_command
        'ttf2eot'
      end

    end
  end
end
