module DragonflyFonts
  module Processors
    class SetWidth

      # relative: 
      # when absent or 0 the vertical width will be set to width
      # when 1 then the vertical width will be incremented by the first
      # when 2 then the vertical width will be scaled by <first argument>/100.0.
      def call font, width, relative=1
        font.shell_update do |old_path, new_path|
          "fontforge -lang=ff -c 'Open($1); SelectWorthOutputting(); SetWidth(#{width.to_s},#{relative.to_s}); Generate($2);' #{old_path} #{new_path}"
        end
      end

      def update_url attrs, *args
        attrs.style = 'adjwidth'
      end

    end
  end
end
