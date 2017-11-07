require 'shellwords'

module DragonflyFonts
  module Processors
    class SetTtfNames
      # http://partners.adobe.com/public/developer/opentype/index_name.html#enc4
      NAME_IDS = {
        compatible_full: 18,
        copyright: 0,
        description: 10,
        designer: 9,
        designer_url: 12,
        fontname: 1,
        fullname: 4,
        license: 13,
        license_url: 14,
        manufacturer: 8,
        postscript_cid: 20,
        postscript_name: 6,
        preferred_family: 16,
        preferred_subfamily: 17,
        sample_text: 19,
        trademark: 7,
        uid: 3,
        vendor_url: 11,
        version: 5,
        weight: 2
      }

      def call(font, values = {})
        font.shell_update(ext: font.ext || :ttf) do |old_path, new_path|
          "#{fontforge_command} -lang=ff -c 'Open($1); #{command_string(values)} Generate($2);' #{old_path} #{new_path}"
        end
      end

      private # =============================================================

      def fontforge_command
        'fontforge'
      end

      def command_string(values)
        res = []
        values.each do |k, v|
          next unless NAME_IDS.keys.include?(k.to_sym)
          res << "SetTTFName(0x409, #{NAME_IDS[k]}, \"#{Shellwords.escape(v)}\");"
        end
        res.join
      end
    end
  end
end
