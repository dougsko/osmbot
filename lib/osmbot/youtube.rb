module Osmbot
    class Youtube
        include Cinch::Plugin

        Cinch::Plugin.match "https://www.youtube.com/watch"

        def execute(m)
            m.reply m.inspect
            #m.reply system("youtube-dl --get-title --skip-download")
        end
    end
end
