require 'open3'

module Osmbot
    class Youtube
        include Cinch::Plugin

        listen_to :channel

        def listen(m)
            urls = URI.extract(m.message, ["http", "https"]).grep(/youtube|youtu\.be/)
            titles = urls.map {|url| get_title(url)}.compact
            titles.each do |title|
                m.reply("[YouTube] " + title)
            end
        end

        def get_title(url)
            stdout, stderr, status = Open3.capture3("/usr/local/bin/youtube-dl", "--get-title", "--skip-download", url)
            if status.success?
                return stdout.split("\n").first
            end
            nil
        end

    end
end
