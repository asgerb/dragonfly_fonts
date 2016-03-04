module DragonflyFonts
  module Processors
    class NormalizeNames
      def call(font, opts = {})
        font.shell_update(ext: :ttf) do |old_path, new_path|
          "#{fontforge_command} -script #{DragonflyFonts::SCRIPT_DIR.join('normalize_names.sh')} #{old_path} #{new_path}"
        end
      end

      private # =============================================================

      def fontforge_command
        'fontforge'
      end
    end
  end
end
