require 'open3'

module Osmbot
    class Youtube
        include Cinch::Plugin

        listen_to :channel

        def listen(m)
            urls = URI.extract(m.message, ["http", "https"]).grep(/youtube/)
            titles = urls.map {|url| get_title(url)}.compact
            m.reply("[YouTube] " + titles.join(", ")) unless titles.empty?
        end

        def get_title(url)
            stdout, stderr, status = Open3.capture3("/usr/local/bin/youtube-dl", "--get-title", "--skip-download", url)
            if status.success?
                return stdout.chomp
            end
            nil
        end

    end
end
