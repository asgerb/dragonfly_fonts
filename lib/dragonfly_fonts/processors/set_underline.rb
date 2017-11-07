require 'shellwords'

module DragonflyFonts
  module Processors
    class SetUnderline
      def call(content, opts = {})
        upos = opts.fetch(:upos, '')
        uwidth = opts.fetch(:uwidth, '')

        content.shell_update(ext: content.ext || :ttf) do |old_path, new_path|
          "#{underline_script} #{old_path} #{new_path} #{Shellwords.escape(upos)} #{Shellwords.escape(uwidth)}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'adjunderline'
      end

      private # =============================================================

      def underline_script
        DragonflyFonts::SCRIPT_DIR.join('underline.py')
      end
    end
  end
end
