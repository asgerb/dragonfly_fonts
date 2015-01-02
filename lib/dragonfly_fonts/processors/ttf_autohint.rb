module DragonflyFonts
  module Processors
    class TtfAutohint

      def call font
        font.shell_update do |old_path, new_path|
          "#{ttfautohint_command} --strong-stem-width='' --windows-compatibility --composites #{old_path} #{new_path}"
        end
      end

      def update_url attrs, *args
        attrs.style = 'ttfautohint'
      end

      private # =============================================================
      
      def ttfautohint_command
        'ttfautohint'
      end

    end
  end
end
