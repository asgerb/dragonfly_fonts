require 'shellwords'

module DragonflyFonts
  module Processors
    class SetWoffMetadata
      def call(content, uniqueid, licensee_name = '')
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        content.shell_update(ext: 'woff') do |old_path, new_path|
          "#{woff_meta_script} #{old_path} #{new_path} #{Shellwords.escape(uniqueid)} #{Shellwords.escape(licensee_name)}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'woffmeta'
      end

      private

      def woff_meta_script
        DragonflyFonts::SCRIPT_DIR.join('woff_meta.py')
      end
    end
  end
end
