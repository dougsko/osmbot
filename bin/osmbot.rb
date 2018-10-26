#!/usr/bin/env ruby

require "bundler/setup"
require "osmbot"

bot = Osmbot::Bot.new("irc.freenode.net", "icculus", ["#opensourcemusicians"])
bot.start
