require 'cinch'
require "osmbot/version"
#require 'osmbot/youtube'

module Osmbot
    class Youtube
        include Cinch::Plugin

        set :prefix, //
        match /(https:\/\/www\.youtube\.com\/watch\?v=[^\s]+)/, group: :url, method: :get_title

        def execute(m, arg)
            m.reply arg
        end

        def get_title(m, arg)
            arg.match(/(https:\/\/www\.youtube\.com\/watch\?v=[^\s;:]+)/)
            title = `/usr/local/bin/youtube-dl --get-title --skip-download \"#{$1}\"`
            if title.size > 0
                m.reply("[YouTube] " + title)
            end
        end
    end

    class Bot
        def initialize
            @bot = Cinch::Bot.new do
                configure do |c|
                    c.server = "irc.freenode.org"
                    c.nick = "osmbot"
                    c.channels = ["#dougskofoo"]
                    c.plugins.plugins = [Youtube]
                end
            end
        end

        def start
            @bot.start
        end
    end
end
