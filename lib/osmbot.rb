require 'cinch'
require "osmbot/version"
require 'osmbot/youtube'

module Osmbot
    class Bot
        def initialize(server, nick, channels)
            @bot = Cinch::Bot.new do
                configure do |c|
                    c.server = server
                    c.nick = nick
                    c.realname = nick
                    c.user = nick
                    c.channels = channels
                    c.plugins.prefix = //
                    c.plugins.plugins = [Youtube]
                end
            end
        end

        def start
            @bot.start
        end
    end
end
