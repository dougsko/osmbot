#!/usr/bin/env ruby

require "bundler/setup"
require "osmbot"
require 'daemons'

Daemons.daemonize
bot = Osmbot::Bot.new("irc.freenode.net", "nomind", ARGV[0], ["#opensourcemusicians", "#dougsko"])
bot.start


