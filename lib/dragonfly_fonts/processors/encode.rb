require 'shellwords'

module DragonflyFonts
  module Processors
    class Encode
      class UnsupportedFormat < RuntimeError; end

      def call(content, format)
        content.shell_update(ext: format, escape: false) do |old_path, new_path|
          if content.ext == 'ttx' || content.meta['format'] == 'ttx'
            fonttools(old_path, new_path)
          else
            case format.to_sym
            when :eot then ttf2eot(old_path, new_path)
            when :otf, :svg, :ttf, :woff then fontforge(old_path, new_path)
            when :ttx then fonttools(old_path, new_path)
            when :woff2 then woff2(old_path, new_path)
            else fail UnsupportedFormat
            end
          end
        end

        content.meta['format'] = format.to_s
        content.ext = format
      end

      def update_url(attrs, format, _args = '')
        attrs.ext = format.to_s
      end

      private # =============================================================

      def fontforge(old_path, new_path)
        "#{fontforge_command} -lang=ff -c 'Open($1); Generate($2)' #{old_path} #{new_path}"
      end

      def fontforge_command
        'fontforge'
      end

      # ---------------------------------------------------------------------

      def fonttools(old_path, new_path)
        "#{fonttools_command} -o #{new_path} #{old_path}"
      end

      def fonttools_command
        'ttx'
      end

      # ---------------------------------------------------------------------

      def ttf2eot(old_path, new_path)
        "#{ttf2eot_command} < #{old_path} > #{new_path}"
      end

      def ttf2eot_command
        'ttf2eot'
      end

      # ---------------------------------------------------------------------

      def woff2(old_path, new_path)
        "#{woff2_command} #{old_path} && mv #{old_path.gsub(/\.\w{3,5}\z/, '.woff2')} #{new_path}"
      end

      def woff2_command
        'woff2_compress'
      end
    end
  end
end
