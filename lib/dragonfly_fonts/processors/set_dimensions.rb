module DragonflyFonts
  module Processors
    class SetDimensions
      def call(content, opts = {})
        ascent = opts.fetch(:ascent, '')
        descent = opts.fetch(:descent, '')

        content.shell_update(ext: content.ext || :ttf) do |old_path, new_path|
          "#{dimensions_script} #{old_path} #{new_path} #{Shellwords.escape(ascent)} #{Shellwords.escape(descent)}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'adjdimensions'
      end

      private # =============================================================

      def dimensions_script
        DragonflyFonts::SCRIPT_DIR.join('dimensions.py')
      end
    end
  end
end
