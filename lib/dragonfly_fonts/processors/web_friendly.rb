module DragonflyFonts
  module Processors
    class WebFriendly
      def call(font, opts = {})
        font.shell_update(ext: font.ext || :ttf) do |old_path, new_path|
          "#{fontforge_command} -script #{DragonflyFonts::SCRIPT_DIR.join('webfonts.pe')} #{old_path} #{new_path}"
        end
      end

      private # =============================================================

      def fontforge_command
        'fontforge'
      end
    end
  end
end
