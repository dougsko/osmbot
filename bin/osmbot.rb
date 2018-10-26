#!/usr/bin/env ruby

require "bundler/setup"
require "osmbot"

bot = Osmbot::Bot.new("irc.freenode.net", "nomind", ARGV[0], ["#opensourcemusicians"])
bot.start
